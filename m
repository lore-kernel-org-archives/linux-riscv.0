Return-Path: <SRS0=gmBF=KD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1025AC433ED
	for <linux-riscv@archiver.kernel.org>; Sat,  8 May 2021 16:50:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FCD361221
	for <linux-riscv@archiver.kernel.org>; Sat,  8 May 2021 16:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FCD361221
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=htgobMV9sYYJFgpX+nWtWsGcHGgUg+eTBL1UGa+pTuw=; b=d2YhaKkifX/biri+utk8PlrUyv
	7rMXVSHnvFeOwQkpRwhy8YO7O+aS1lm6E1fLUwb5p1KwSmkoZlukG6PtO6K62rX0o8454lpeGQoJq
	EKPKNAvEFBG2aDgff7L3JWeWWeq8lUvDGtPg3Lu+hPDAJQCuqJjkjZZkH2p/liDGB+HnXhOj5cCVs
	i7LC/EzMJT/kD0aX7gkBdxbTxPkrYch64nPPbhTOLnFsW0NxEhLKyeJIa0Fw7TMmiEkgG0MXW4oVR
	D4yKLMVO5TU64GCFagd3MBjU+HE7oaL0FfXRoQUFosdp5oft7rlx0Z+s3CUSXtAj/nW4P0I1uYE6g
	l4t9Mjgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfQ9i-009wew-SJ; Sat, 08 May 2021 16:50:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfQ9g-009weV-4y
 for linux-riscv@desiato.infradead.org; Sat, 08 May 2021 16:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=K6LVt34SQzz13XGIT9Z6S5bUZ33mDxAs2zHLD6vXxQU=; b=pjo+Q/iQ7BxhVrVAfLCtOrSoce
 kieDvjMuUA51/J52yZ+AZ50v5Ui8fCdIGuO/xLXcsbw2zv8UosvoPP4WlZ3UJMPrBhm/OArNMCASI
 IYSS2/ps0QeYUTxfdC2zegAaogXhSI/cvCPrLlZ8lGm+O95/ZA1NjvtOFsRN23kKUlVQaFhy1J2A+
 HsWjNlrDB3hgGPTez8bDL4/khIHK4KUSThoNdJCKoqSGmx4BBmbO60Ys4Wh563VCAzmdsal/2PZDe
 x3IXB/ez/I2McfjmW70QYSw6QWSeFjpgklpyP9JIQsDwW5cqvciZJ138ASW/aFA8J1KOfzyTF2uPj
 HMySD9JA==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lfQ9Z-007dpq-Iw
 for linux-riscv@lists.infradead.org; Sat, 08 May 2021 16:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=K6LVt34SQzz13XGIT9Z6S5bUZ33mDxAs2zHLD6vXxQU=; b=qoo6Zh5yQn0s3
 SNwq/ifF29oiT44vaf6AJ6ikM9bhCKKaqdxFVabDvUvydDYSR+oskvLIPy6r6haw
 XJGxuHgLZ8jWvkOLyDwAD/P7PCl8q6/GwYwtMKOxDkdDLTPMpYqBGudXIOMplpxc
 ECtgDRSdxtEJZxEdbmXbXqZR4V0gYo=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDX3Jg0wZZgKLqmAA--.53565S2; 
 Sun, 09 May 2021 00:49:57 +0800 (CST)
Date: Sun, 9 May 2021 00:44:43 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nick Kossifidis
 <mick@ics.forth.gr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: kexec: Fix W=1 build warnings
Message-ID: <20210509004443.62c2dd5e@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDX3Jg0wZZgKLqmAA--.53565S2
X-Coremail-Antispam: 1UD129KBjvJXoWxury3CFW7AFWrAr4kZF4rGrg_yoWrGFykpa
 1qyr1jvrWUWr1Syr1fArn7uw15Ww1DWa4ayrykGF95WF4DK3yUJwnrXw1jka1UKFyFgrn2
 qF1ag3WFkw13C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
 0_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j
 6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210508_095010_290088_38B95375 
X-CRM114-Status: GOOD (  10.43  )
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

RnJvbTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgoKRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEgYnVpbGQgd2FybmluZyhzKToKCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRl
L2xpbnV4L2tleGVjLmg6MjgsCiAgICAgICAgICAgICAgICAgZnJvbSBhcmNoL3Jpc2N2L2tlcm5l
bC9tYWNoaW5lX2tleGVjLmM6NzoKYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhlYy5oOjQ1OjE6
IHdhcm5pbmc6IOKAmGV4dGVybuKAmSBpcyBub3QgYXQgYmVnaW5uaW5nIG9mIGRlY2xhcmF0aW9u
IFstV29sZC1zdHlsZS1kZWNsYXJhdGlvbl0KICAgNDUgfCBjb25zdCBleHRlcm4gdW5zaWduZWQg
Y2hhciByaXNjdl9rZXhlY19yZWxvY2F0ZVtdOwogICAgICB8IF5+fn5+CmFyY2gvcmlzY3YvaW5j
bHVkZS9hc20va2V4ZWMuaDo0NjoxOiB3YXJuaW5nOiDigJhleHRlcm7igJkgaXMgbm90IGF0IGJl
Z2lubmluZyBvZiBkZWNsYXJhdGlvbiBbLVdvbGQtc3R5bGUtZGVjbGFyYXRpb25dCiAgIDQ2IHwg
Y29uc3QgZXh0ZXJuIHVuc2lnbmVkIGludCByaXNjdl9rZXhlY19yZWxvY2F0ZV9zaXplOwogICAg
ICB8IF5+fn5+CmFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYzoxMjU6Njogd2Fybmlu
Zzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhtYWNoaW5lX3NodXRkb3du4oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KICAxMjUgfCB2b2lkIG1hY2hpbmVfc2h1dGRvd24odm9pZCkKICAg
ICAgfCAgICAgIF5+fn5+fn5+fn5+fn5+fn4KYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhl
Yy5jOjE0NzoxOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmG1hY2hpbmVf
Y3Jhc2hfc2h1dGRvd27igJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogIDE0NyB8IG1hY2hpbmVf
Y3Jhc2hfc2h1dGRvd24oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAgICAgIHwgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgphcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmM6MjM6IHdhcm5pbmc6
IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ltYWdlJyBub3QgZGVzY3JpYmVkIGluICdr
ZXhlY19pbWFnZV9pbmZvJwphcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmM6NTM6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ltYWdlJyBub3QgZGVzY3JpYmVk
IGluICdtYWNoaW5lX2tleGVjX3ByZXBhcmUnCmFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4
ZWMuYzoxMTQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ltYWdlJyBu
b3QgZGVzY3JpYmVkIGluICdtYWNoaW5lX2tleGVjX2NsZWFudXAnCmFyY2gvcmlzY3Yva2VybmVs
L21hY2hpbmVfa2V4ZWMuYzoxNDg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIgJ3JlZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ21hY2hpbmVfY3Jhc2hfc2h1dGRvd24nCmFyY2gv
cmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYzoxNjc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ2ltYWdlJyBub3QgZGVzY3JpYmVkIGluICdtYWNoaW5lX2tleGVjJwoK
U2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgotLS0KIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va2V4ZWMuaCAgICB8ICA0ICsrLS0KIGFyY2gvcmlzY3Yva2Vy
bmVsL21hY2hpbmVfa2V4ZWMuYyB8IDExICsrKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2tleGVjLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmgKaW5kZXgg
MWU5NTQxMDE5MDZhLi5lNGUyOTFkNDA3NTkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va2V4ZWMuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmgKQEAgLTQy
LDggKzQyLDggQEAgc3RydWN0IGtpbWFnZV9hcmNoIHsKIAl1bnNpZ25lZCBsb25nIGZkdF9hZGRy
OwogfTsKIAotY29uc3QgZXh0ZXJuIHVuc2lnbmVkIGNoYXIgcmlzY3Zfa2V4ZWNfcmVsb2NhdGVb
XTsKLWNvbnN0IGV4dGVybiB1bnNpZ25lZCBpbnQgcmlzY3Zfa2V4ZWNfcmVsb2NhdGVfc2l6ZTsK
K2V4dGVybiBjb25zdCB1bnNpZ25lZCBjaGFyIHJpc2N2X2tleGVjX3JlbG9jYXRlW107CitleHRl
cm4gY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X2tleGVjX3JlbG9jYXRlX3NpemU7CiAKIHR5cGVk
ZWYgdm9pZCAoKnJpc2N2X2tleGVjX21ldGhvZCkodW5zaWduZWQgbG9uZyBmaXJzdF9pbmRfZW50
cnksCiAJCQkJICAgdW5zaWduZWQgbG9uZyBqdW1wX2FkZHIsCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tl
eGVjLmMKaW5kZXggY2MwNDgxNDNmYmE1Li45ZTk5ZTFkYjE1NmIgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNo
aW5lX2tleGVjLmMKQEAgLTE0LDggKzE0LDkgQEAKICNpbmNsdWRlIDxhc20vc2V0X21lbW9yeS5o
PgkvKiBGb3Igc2V0X21lbW9yeV94KCkgKi8KICNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgkv
KiBGb3IgdW5yZWFjaGFibGUoKSAqLwogI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgkJLyogRm9yIGNw
dV9kb3duKCkgKi8KKyNpbmNsdWRlIDxsaW51eC9yZWJvb3QuaD4KIAotLyoqCisvKgogICoga2V4
ZWNfaW1hZ2VfaW5mbyAtIFByaW50IHJlY2VpdmVkIGltYWdlIGRldGFpbHMKICAqLwogc3RhdGlj
IHZvaWQKQEAgLTM5LDcgKzQwLDcgQEAga2V4ZWNfaW1hZ2VfaW5mbyhjb25zdCBzdHJ1Y3Qga2lt
YWdlICppbWFnZSkKIAl9CiB9CiAKLS8qKgorLyoKICAqIG1hY2hpbmVfa2V4ZWNfcHJlcGFyZSAt
IEluaXRpYWxpemUga2V4ZWMKICAqCiAgKiBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBmcm9tIGRv
X2tleGVjX2xvYWQsIHdoZW4gdGhlIHVzZXIgaGFzCkBAIC0xMDAsNyArMTAxLDcgQEAgbWFjaGlu
ZV9rZXhlY19wcmVwYXJlKHN0cnVjdCBraW1hZ2UgKmltYWdlKQogfQogCiAKLS8qKgorLyoKICAq
IG1hY2hpbmVfa2V4ZWNfY2xlYW51cCAtIENsZWFudXAgYW55IGxlZnRvdmVycyBmcm9tCiAgKgkJ
CSAgIG1hY2hpbmVfa2V4ZWNfcHJlcGFyZQogICoKQEAgLTEzNSw3ICsxMzYsNyBAQCB2b2lkIG1h
Y2hpbmVfc2h1dGRvd24odm9pZCkKICNlbmRpZgogfQogCi0vKioKKy8qCiAgKiBtYWNoaW5lX2Ny
YXNoX3NodXRkb3duIC0gUHJlcGFyZSB0byBrZXhlYyBhZnRlciBhIGtlcm5lbCBjcmFzaAogICoK
ICAqIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIGJ5IGNyYXNoX2tleGVjIGp1c3QgYmVmb3JlIG1h
Y2hpbmVfa2V4ZWMKQEAgLTE1MSw3ICsxNTIsNyBAQCBtYWNoaW5lX2NyYXNoX3NodXRkb3duKHN0
cnVjdCBwdF9yZWdzICpyZWdzKQogCXByX2luZm8oIlN0YXJ0aW5nIGNyYXNoZHVtcCBrZXJuZWwu
Li5cbiIpOwogfQogCi0vKioKKy8qCiAgKiBtYWNoaW5lX2tleGVjIC0gSnVtcCB0byB0aGUgbG9h
ZGVkIGtpbWFnZQogICoKICAqIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIGJ5IGtlcm5lbF9rZXhl
YyB3aGljaCBpcyBjYWxsZWQgYnkgdGhlCi0tIAoyLjMxLjAKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
