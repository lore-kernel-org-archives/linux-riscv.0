Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F0ECCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcPtMzK09FF//eqkwGLioiiZr5TYui8rAmJ74uufs6k=; b=Zcup44pcT4HNA3
	Sdv9g/8kCvOj+6mdXGHkGXzzElJDniQOA/BqVt4rhmZrqo2h2/xwT2KZOC6AayuFNKrhBhgCv1tFa
	zqztIPQWz3YfJZZ+gsXUPhWN1NM3CGXEfxXARXIeFAz64aoxqsJ8olfQWV1dN617xNI+hixLMWWxf
	IrmpFV4yqwEQoU3UguqJ0ouYPvtzGVVxXa+XLRR2V0T2MUPkbR0STV9Bn2lUsUD1DoSDQf4IDKGqX
	ng4EdOxZFIgU427Bhni2JuWHraMg4SLrBmdv90MFB1HQ+W20nzGgt7yteeviLpODSmSyGtKpctOaD
	eQe5TDp2z2dICUjDnNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxYo-00000006oDf-0KuY;
	Thu, 23 Oct 2025 15:49:06 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxYk-00000006oAo-00IF
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 15:49:04 +0000
Received: from Mobilestation.localdomain (unknown [183.6.59.216])
	by APP-03 (Coremail) with SMTP id rQCowACn7XdgTvpow9w+FQ--.772S2;
	Thu, 23 Oct 2025 23:48:51 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: ajones@ventanamicro.com
Cc: alex@ghiti.fr,
	alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	shuah@kernel.org,
	zhangyin2018@iscas.ac.cn,
	zihong.plct@isrc.iscas.ac.cn,
	zihongyao@outlook.com
Subject: Re: [PATCH v3 2/2] selftests/riscv: Add Zicbop prefetch test
Date: Thu, 23 Oct 2025 23:48:18 +0800
Message-ID: <20251023154841.36007-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021-01a9b77e3d88543581f1a7fb@orel>
References: <20251021-01a9b77e3d88543581f1a7fb@orel>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACn7XdgTvpow9w+FQ--.772S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF48tF1xKw4DZw47KFyUZFb_yoWDArg_Zr
	yDJrnrJa9Fyr9Yqw47C3WYvrn3C34agr1UGw10qwn7tw18ZFZrCr4qvF9xJ3WDCw43Z3s0
	9wn8Kry3Aw13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [183.6.59.216]
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_084902_415152_636705E8 
X-CRM114-Status: UNSURE (   7.70  )
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

PiBVbmRlc2lyZWQgcmVmb3JtYXR0aW5nCk15IGJhZC4gSXQgd2lsbCBiZSBmaXhlZCBpbiB0aGUg
bmV4dCB2ZXJzaW9uLgoKPiBTaG91bGQgd2UganVzdCB1bmNvbmRpdGlvbmFsbHkgcmVnaXN0ZXIg
aGFuZGxlcnMgZm9yIFNJR1NFR1YgYW5kIFNJR0JVUz8KSSB0aGluayBpdCBkZXBlbmRzIG9uIHdo
YXQgdGhlIGZsYWdzIC0tc2lne3NlZ3YsaWxsLGJ1c30gYXJlIGludGVuZGVkIHRvIG1lYW46Cgog
IGEpIFdlIGludGVuZCB0byBoYW5kbGUgdGhlc2UgZmF1bHRzIHRoYXQgbWlnaHQgYmUgcmFpc2Vk
IGluc2lkZSB0aGUgdGVzdAogICAgIChpLmUuLCBjYXRjaCBhbmQgY29udmVydCB0aGVtIGludG8g
cGFzcy9mYWlsIHJlc3VsdHMgd2l0aG91dCBjcmFzaGluZyB0aGUKICAgICB0ZXN0IGJpbmFyeSwg
cmF0aGVyIHRoYW4gbGV0dGluZyBzb21ldGhpbmcgZWxzZSBoYW5kbGUgdGhlbSBleHRlcm5hbGx5
KS4KICBiKSBXZSBleHBlY3QgdGhlc2Ugc2lnbmFscyB0byBiZSByYWlzZWQgYXMgcGFydCBvZiB0
aGUgdGVzdCBzY2VuYXJpbyBhbmQKICAgICBoYW5kbGUgdGhlbSB3aXRoaW4gdGhlIHRlc3QgcHJv
Z3JhbSBhY2NvcmRpbmdseS4KCkknbSBub3Qgc3VyZSBpZiAoYSkgaXMgYXBwcm9wcmlhdGUsIHNp
bmNlIGl0IG1pZ2h0IG1lc3MgdXAgc29tZW9uZeKAmXMgQ0kKb3Igb3RoZXIgYXV0b21hdGlvbiBz
ZXR1cHMuCgpJZiB3ZeKAmXJlIGdvaW5nIHdpdGggKGIpLCB0aGVuIHJlZ2lzdGVyaW5nIGhhbmRs
ZXJzIGZvciBTSUdTRUdWIGFuZCBTSUdCVVMKYmFzZWQgb24gZmxhZ3Mgd291bGQgYmUgaW5jb25z
aXN0ZW50IHdpdGggdGhhdCBzZW1hbnRpY3MsIHNpbmNlIHByZWZldGNoLioKc2hvdWxkIG5ldmVy
IGxlZ2l0aW1hdGVseSByYWlzZSB0aGVtLiBJbiB0aGF0IGNhc2UsIHRoaXMgZGVzaWduIHByb2Jh
Ymx5CmRvZXNu4oCZdCBtYWtlIHNlbnNlLiBXb3VsZCBpdCBhbHNvIG1ha2Ugc2Vuc2UgdG8gcmVu
YW1lIHRoZSAnLS1zaWdpbGwnIGZsYWcKdG8gbWFrZSB0aGlzIGNsZWFyZXI/CgpUaGFua3MsClpp
aG9uZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
