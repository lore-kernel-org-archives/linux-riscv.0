Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCBBC352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9nyHFKh6vy/78ucyvQtnqfnhRXC0S7qz70x8WMuHbrk=; b=x5oCMgJYl5foMK
	vNGGaWFLhS2I5tAZ/+ji02R8jZkdnfvZbmSXtCSngU9j+1/pR4/ZS5W7hEi/uGLYFq5Fb0ulHzUMb
	oewukxnsckKJ7sq+h+tReU4htfb5zy7tv13nklIdTMh9NLea9IVlreDTEn68CeblSvz2g8Sp1f8Nl
	HSL1WFtrZAQ+O8h3eGoUjWzgQQq/+LqognSvzgnBVt4q/Z/uOm0W/ndJ5qMU+KmjjW8RiBND1BhHv
	7IQ/vEnBaxD1ng1H0diNH+IEg4KybQrDuPlBAf44gAGFnCNNtQsreBgJ3AHLQWcJKor/0Rl6HplGN
	467We3TC87OsIydDHmwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2U17-005ci5-8Q; Tue, 06 Dec 2022 09:13:33 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2U12-005cSc-5R
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 09:13:31 +0000
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NRF7x1tdJz4f3w0D
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 17:13:17 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP4 (Coremail) with SMTP id gCh0CgCXCNavB49jTw3_Bg--.27878S2;
	Tue, 06 Dec 2022 17:13:20 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf v3] riscv, bpf: Emit fixed-length instructions for BPF_PSEUDO_FUNC
Date: Tue,  6 Dec 2022 17:14:10 +0800
Message-Id: <20221206091410.1584784-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgCXCNavB49jTw3_Bg--.27878S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFy5AFyxuryDur4UAryxZrb_yoW8uFW5pF
	ZxGrn3CFWvqr1fGr13tF1jqr1SkF4vqFWfKry7G3y5J3ZIqwsF93Z8Gw4jyas8Zry8Gr15
	JFWjkF98ua4Dta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	fUOmhFUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_011328_564915_7E8E45A4 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkZvciBCUEZfUFNFVURPX0ZVTkMg
aW5zdHJ1Y3Rpb24sIHZlcmlmaWVyIHdpbGwgcmVmaWxsIGltbSB3aXRoCmNvcnJlY3QgYWRkcmVz
c2VzIG9mIGJwZl9jYWxscyBhbmQgdGhlbiBydW4gbGFzdCBwYXNzIG9mIEpJVC4KU2luY2UgdGhl
IGVtaXRfaW1tIG9mIFJWNjQgaXMgdmFyaWFibGUtbGVuZ3RoLCB3aGljaCB3aWxsIGVtaXQKYXBw
cm9wcmlhdGUgbGVuZ3RoIGluc3RydWN0aW9ucyBhY2NvcnJvZGluZyB0byB0aGUgaW1tLCBpdCBt
YXkKYnJva2UgY3R4LT5vZmZzZXQsIGFuZCBsZWFkIHRvIHVucHJlZGljdGFibGUgcHJvYmxlbSwg
c3VjaCBhcwppbmFjY3VyYXRlIGp1bXAuIFNvIGxldCdzIGZpeCBpdCB3aXRoIGZpeGVkLWxlbmd0
aCBpbnN0cnVjdGlvbnMuCgpGaXhlczogNjljMDg3YmE2MjI1ICgiYnBmOiBBZGQgYnBmX2Zvcl9l
YWNoX21hcF9lbGVtKCkgaGVscGVyIikKU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlA
aHVhd2VpLmNvbT4KU3VnZ2VzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+Ci0tLQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDI5ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMg
Yi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmluZGV4IDg5NzQ0ZGJkNmQ4Ni4uMmY2
MjA3YjcyZTEyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCisr
KyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAgLTEzOSw2ICsxMzksMjUgQEAg
c3RhdGljIGJvb2wgaW5fYXVpcGNfamFscl9yYW5nZShzNjQgdmFsKQogCQl2YWwgPCAoKDFMIDw8
IDMxKSAtICgxTCA8PCAxMSkpOwogfQogCisvKiBFbWl0IGZpeGVkLWxlbmd0aCBpbnN0cnVjdGlv
bnMgZm9yIGFkZHJlc3MgKi8KK3N0YXRpYyBpbnQgZW1pdF9hZGRyKHU4IHJkLCB1NjQgYWRkciwg
Ym9vbCBleHRyYV9wYXNzLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKK3sKKwl1NjQgaXAg
PSAodTY0KShjdHgtPmluc25zICsgY3R4LT5uaW5zbnMpOworCXM2NCBvZmYgPSBhZGRyIC0gaXA7
CisJczY0IHVwcGVyID0gKG9mZiArICgxIDw8IDExKSkgPj4gMTI7CisJczY0IGxvd2VyID0gb2Zm
ICYgMHhmZmY7CisKKwlpZiAoZXh0cmFfcGFzcyAmJiAhaW5fYXVpcGNfamFscl9yYW5nZShvZmYp
KSB7CisJCXByX2VycigiYnBmLWppdDogdGFyZ2V0IG9mZnNldCAweCVsbHggaXMgb3V0IG9mIHJh
bmdlXG4iLCBvZmYpOworCQlyZXR1cm4gLUVSQU5HRTsKKwl9CisKKwllbWl0KHJ2X2F1aXBjKHJk
LCB1cHBlciksIGN0eCk7CisJZW1pdChydl9hZGRpKHJkLCByZCwgbG93ZXIpLCBjdHgpOworCXJl
dHVybiAwOworfQorCisvKiBFbWl0IHZhcmlhYmxlLWxlbmd0aCBpbnN0cnVjdGlvbnMgZm9yIDMy
LWJpdCBhbmQgNjQtYml0IGltbSAqLwogc3RhdGljIHZvaWQgZW1pdF9pbW0odTggcmQsIHM2NCB2
YWwsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQogewogCS8qIE5vdGUgdGhhdCB0aGUgaW1t
ZWRpYXRlIGZyb20gdGhlIGFkZCBpcyBzaWduLWV4dGVuZGVkLApAQCAtMTA1Myw3ICsxMDcyLDE1
IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2luc24gKmluc24sIHN0
cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAogCQl1NjQgaW1tNjQ7CiAKIAkJaW1tNjQgPSAodTY0
KWluc24xLmltbSA8PCAzMiB8ICh1MzIpaW1tOwotCQllbWl0X2ltbShyZCwgaW1tNjQsIGN0eCk7
CisJCWlmIChicGZfcHNldWRvX2Z1bmMoaW5zbikpIHsKKwkJCS8qIGZpeGVkLWxlbmd0aCBpbnNu
cyBmb3IgZXh0cmEgaml0IHBhc3MgKi8KKwkJCXJldCA9IGVtaXRfYWRkcihyZCwgaW1tNjQsIGV4
dHJhX3Bhc3MsIGN0eCk7CisJCQlpZiAocmV0KQorCQkJCXJldHVybiByZXQ7CisJCX0gZWxzZSB7
CisJCQllbWl0X2ltbShyZCwgaW1tNjQsIGN0eCk7CisJCX0KKwogCQlyZXR1cm4gMTsKIAl9CiAK
LS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
