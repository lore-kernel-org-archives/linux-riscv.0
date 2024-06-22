Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8C7C27C4F
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 03:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VANv2S4n/WSBqorQXlMymLxaaKZRHlkk1TiR6/ATQ7I=; b=O3U1BuIU/oA9UE
	OI6/h8jjVpkMLqdB2aXZetAjchL1lRYWhTJ8p451I+AbrpZXQvbAN7B5iN63Tm5wei0xhFkQk2zYv
	kiHHZAjCLvcjivFVQlIe3buLjp7Gs7qjImn1YR9y3ePPfc5qonZuC7OnhEEHUb1WWI+fnAGxO7TDh
	Ts0ExHJc8XVRWdp3EDEXdBg4yKVRu8N37VgWWChtb71lUYrXKVpSfVv8FCmQ+dHFZ0uNRo1i5wpC/
	vWyMiQPsvqeyi6Rg/sgBvN9nSKvWpn/a5rbieR+mUagyk03eFQZ0Q67y7M1eUF+R1Z13iu+HqTQoL
	HGxAzhwuIXQuzN04CsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKr27-0000000BFDk-2um5;
	Sat, 22 Jun 2024 03:03:19 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKr20-0000000BFA5-0tS4
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 03:03:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4W5fDD5h8Wz4f3kF9
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jun 2024 11:02:52 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 5C3A21A058E
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jun 2024 11:03:03 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgDXa63kPnZmMh5lAg--.15052S5;
	Sat, 22 Jun 2024 11:03:03 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH RESEND bpf-next v2 3/3] riscv, bpf: Use bpf_prog_pack for RV64 bpf trampoline
Date: Sat, 22 Jun 2024 03:04:37 +0000
Message-Id: <20240622030437.3973492-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240622030437.3973492-1-pulehui@huaweicloud.com>
References: <20240622030437.3973492-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDXa63kPnZmMh5lAg--.15052S5
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy8ZryUZw4rXryrJrykuFg_yoWrJr13pa
	n7Cw1akaykXr15ta4kJ3yUZF1ak3ykW343GF9xG3y8CFZ0vr98GryrK3yFvFWFkryFkr18
	AF4qvrn8u3WUJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU1c4S7UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_200312_643764_1CF6CE1A 
X-CRM114-Status: GOOD (  12.46  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCldlIHVzZWQgYnBmX3Byb2dfcGFj
ayB0byBhZ2dyZWdhdGUgYnBmIHByb2dyYW1zIGludG8gaHVnZSBwYWdlIHRvCnJlbGlldmUgdGhl
IGlUTEIgcHJlc3N1cmUgb24gdGhlIHN5c3RlbS4gV2UgY2FuIGFwcGx5IGl0IHRvIGJwZgp0cmFt
cG9saW5lLCBhcyBTb25nIGhhZCBiZWVuIGltcGxlbWVudGVkIGl0IGluIGNvcmUgYW5kIHg4NiBb
MF0uIFRoaXMKcGF0Y2ggaXMgZ29pbmcgdG8gdXNlIGJwZl9wcm9nX3BhY2sgdG8gUlY2NCBicGYg
dHJhbXBvbGluZS4gU2luY2UgU29uZwphbmQgUHVyYW5qYXkgaGF2ZSBkb25lIGEgbG90IG9mIHdv
cmsgZm9yIGJwZl9wcm9nX3BhY2sgb24gUlY2NCwKaW1wbGVtZW50aW5nIHRoaXMgZnVuY3Rpb24g
d2lsbCBiZSBlYXN5LgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMjA2
MjI0MDU0LjQ5MjI1MC0xLXNvbmdAa2VybmVsLm9yZyBbMF0KU2lnbmVkLW9mZi1ieTogUHUgTGVo
dWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+ICNyaXNjdgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMg
fCA0MyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
OSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpp
bmRleCBlNmQ2OTA2NTdmM2UuLjM1MWUxNDg0MjA1ZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wNjQuYworKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
CkBAIC05NTcsNyArOTU3LDcgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBv
bGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICppbSwKIAkJCWdvdG8gb3V0OwogCQllbWl0X3Nk
KFJWX1JFR19GUCwgLXJldHZhbF9vZmYsIFJWX1JFR19BMCwgY3R4KTsKIAkJZW1pdF9zZChSVl9S
RUdfRlAsIC0ocmV0dmFsX29mZiAtIDgpLCByZWdtYXBbQlBGX1JFR18wXSwgY3R4KTsKLQkJaW0t
PmlwX2FmdGVyX2NhbGwgPSBjdHgtPmluc25zICsgY3R4LT5uaW5zbnM7CisJCWltLT5pcF9hZnRl
cl9jYWxsID0gY3R4LT5yb19pbnNucyArIGN0eC0+bmluc25zOwogCQkvKiAyIG5vcHMgcmVzZXJ2
ZWQgZm9yIGF1aXBjK2phbHIgcGFpciAqLwogCQllbWl0KHJ2X25vcCgpLCBjdHgpOwogCQllbWl0
KHJ2X25vcCgpLCBjdHgpOwpAQCAtOTc4LDcgKzk3OCw3IEBAIHN0YXRpYyBpbnQgX19hcmNoX3By
ZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJfQogCiAJ
aWYgKGZsYWdzICYgQlBGX1RSQU1QX0ZfQ0FMTF9PUklHKSB7Ci0JCWltLT5pcF9lcGlsb2d1ZSA9
IGN0eC0+aW5zbnMgKyBjdHgtPm5pbnNuczsKKwkJaW0tPmlwX2VwaWxvZ3VlID0gY3R4LT5yb19p
bnNucyArIGN0eC0+bmluc25zOwogCQllbWl0X2ltbShSVl9SRUdfQTAsIGN0eC0+aW5zbnMgPyAo
Y29uc3QgczY0KWltIDogUlZfTUFYX0NPVU5UX0lNTSwgY3R4KTsKIAkJcmV0ID0gZW1pdF9jYWxs
KChjb25zdCB1NjQpX19icGZfdHJhbXBfZXhpdCwgdHJ1ZSwgY3R4KTsKIAkJaWYgKHJldCkKQEAg
LTEwNDEsMjUgKzEwNDEsMzMgQEAgaW50IGFyY2hfYnBmX3RyYW1wb2xpbmVfc2l6ZShjb25zdCBz
dHJ1Y3QgYnRmX2Z1bmNfbW9kZWwgKm0sIHUzMiBmbGFncywKIAlyZXR1cm4gcmV0IDwgMCA/IHJl
dCA6IG5pbnNuc19ydm9mZihjdHgubmluc25zKTsKIH0KIAotaW50IGFyY2hfcHJlcGFyZV9icGZf
dHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICppbSwgdm9pZCAqaW1hZ2UsCi0JCQkJ
dm9pZCAqaW1hZ2VfZW5kLCBjb25zdCBzdHJ1Y3QgYnRmX2Z1bmNfbW9kZWwgKm0sCit2b2lkICph
cmNoX2FsbG9jX2JwZl90cmFtcG9saW5lKHVuc2lnbmVkIGludCBzaXplKQoreworCXJldHVybiBi
cGZfcHJvZ19wYWNrX2FsbG9jKHNpemUsIGJwZl9maWxsX2lsbF9pbnNucyk7Cit9CisKK3ZvaWQg
YXJjaF9mcmVlX2JwZl90cmFtcG9saW5lKHZvaWQgKmltYWdlLCB1bnNpZ25lZCBpbnQgc2l6ZSkK
K3sKKwlicGZfcHJvZ19wYWNrX2ZyZWUoaW1hZ2UsIHNpemUpOworfQorCitpbnQgYXJjaF9wcmVw
YXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZfdHJhbXBfaW1hZ2UgKmltLCB2b2lkICpyb19p
bWFnZSwKKwkJCQl2b2lkICpyb19pbWFnZV9lbmQsIGNvbnN0IHN0cnVjdCBidGZfZnVuY19tb2Rl
bCAqbSwKIAkJCQl1MzIgZmxhZ3MsIHN0cnVjdCBicGZfdHJhbXBfbGlua3MgKnRsaW5rcywKIAkJ
CQl2b2lkICpmdW5jX2FkZHIpCiB7CiAJaW50IHJldDsKKwl2b2lkICppbWFnZSwgKnJlczsKIAlz
dHJ1Y3QgcnZfaml0X2NvbnRleHQgY3R4OwotCXUzMiBzaXplID0gaW1hZ2VfZW5kIC0gaW1hZ2U7
CisJdTMyIHNpemUgPSByb19pbWFnZV9lbmQgLSByb19pbWFnZTsKKworCWltYWdlID0ga3ZtYWxs
b2Moc2l6ZSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFpbWFnZSkKKwkJcmV0dXJuIC1FTk9NRU07CiAK
IAljdHgubmluc25zID0gMDsKLQkvKgotCSAqIFRoZSBicGZfaW50X2ppdF9jb21waWxlKCkgdXNl
cyBhIFJXIGJ1ZmZlciAoY3R4Lmluc25zKSB0byB3cml0ZSB0aGUKLQkgKiBKSVRlZCBpbnN0cnVj
dGlvbnMgYW5kIGxhdGVyIGNvcGllcyBpdCB0byBhIFJYIHJlZ2lvbiAoY3R4LnJvX2luc25zKS4K
LQkgKiBJdCBhbHNvIHVzZXMgY3R4LnJvX2luc25zIHRvIGNhbGN1bGF0ZSBvZmZzZXRzIGZvciBq
dW1wcyBldGMuIEFzIHRoZQotCSAqIHRyYW1wb2xpbmUgaW1hZ2UgdXNlcyB0aGUgc2FtZSBtZW1v
cnkgYXJlYSBmb3Igd3JpdGluZyBhbmQgZXhlY3V0aW9uLAotCSAqIGJvdGggY3R4Lmluc25zIGFu
ZCBjdHgucm9faW5zbnMgY2FuIGJlIHNldCB0byBpbWFnZS4KLQkgKi8KIAljdHguaW5zbnMgPSBp
bWFnZTsKLQljdHgucm9faW5zbnMgPSBpbWFnZTsKKwljdHgucm9faW5zbnMgPSByb19pbWFnZTsK
IAlyZXQgPSBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShpbSwgbSwgdGxpbmtzLCBmdW5j
X2FkZHIsIGZsYWdzLCAmY3R4KTsKIAlpZiAocmV0IDwgMCkKIAkJZ290byBvdXQ7CkBAIC0xMDY5
LDggKzEwNzcsMTUgQEAgaW50IGFyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBm
X3RyYW1wX2ltYWdlICppbSwgdm9pZCAqaW1hZ2UsCiAJCWdvdG8gb3V0OwogCX0KIAotCWJwZl9m
bHVzaF9pY2FjaGUoaW1hZ2UsIGltYWdlX2VuZCk7CisJcmVzID0gYnBmX2FyY2hfdGV4dF9jb3B5
KHJvX2ltYWdlLCBpbWFnZSwgc2l6ZSk7CisJaWYgKElTX0VSUihyZXMpKSB7CisJCXJldCA9IFBU
Ul9FUlIocmVzKTsKKwkJZ290byBvdXQ7CisJfQorCisJYnBmX2ZsdXNoX2ljYWNoZShyb19pbWFn
ZSwgcm9faW1hZ2VfZW5kKTsKIG91dDoKKwlrdmZyZWUoaW1hZ2UpOwogCXJldHVybiByZXQgPCAw
ID8gcmV0IDogc2l6ZTsKIH0KIAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
