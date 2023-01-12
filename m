Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63959C54EBC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mpM33BEPjNaSPGQv6u6TL9JufqtCg0Jn/pEMkMD+hE=; b=tCnqEV43d4+rso
	lxCXm18ABgkDzPm9Qw9n6kyJd5p52qHd+c+Xe3E3J8F901Op8rUE7ILFJBxMkDbptOr6unyeJv/58
	fl8Pf3esfhcMIEXD0IeYV0wxcr3g12D1mtF/vY7mNtwL4iyV0kHNxNdO/54OC1FixjlKSy6E5Hy9q
	QIQPcC0YsjVJFNktJK6ImLdbvLcmiEQ//3X5Y3YSL0eDamrKXCVFRnv/XGahpN0ZhRe5wNdLDup56
	US9NHdyGS+YPbXA0zyRk1fPOuFDbBgtACXpF8m/vUXujEgCi8+ymBYHPd55lFp9xA2I0BT24PAy98
	n5ESHc/Min4wbXhFJsBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuNH-00EUPx-5U; Thu, 12 Jan 2023 09:59:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuND-00EUNI-UA
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 09:59:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5FD5CB81DF9;
	Thu, 12 Jan 2023 09:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB251C433D2;
	Thu, 12 Jan 2023 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673517589;
	bh=NZL7k5T/gq/CBdcI/CQC/x9NElRVpSMRhseuithZiTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tZDKfXQse2ALQ8xrRexWDfwAAE5ECBNUsM1z5ABc2m2n7PTk/w1J+Ng2r7aXmRJc+
	 VIa/6o5fuqRzpMDmRpxQTXqMWQrN4jy3vWnhohjEf/XlAqD5K+MJllh9IcOaJhrqJi
	 WRgOZMNP8FuFvFeD5V7osz2YCoWLTsuV23tz+TlYED9/q4LDesxQSfJgjBGPMMK56w
	 a0xd9SQOZpvO8GDqIfRFzeHjk5I3B45d/bkckHgOlFiR9ioBFLeqlTYYeFLvrEZ8bC
	 O81oHx9rmGUqpiQM3OvOGIJ5cUF6RbJKoUD3JwjgkmrqfEYKQds7SdGQpMxk7K3cuG
	 xROQbbtJTLY3w==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	ben@decadent.org.uk,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH -next V14 6/7] riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork
Date: Thu, 12 Jan 2023 04:58:47 -0500
Message-Id: <20230112095848.1464404-7-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230112095848.1464404-1-guoren@kernel.org>
References: <20230112095848.1464404-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_015952_315432_FDE1ADF1 
X-CRM114-Status: GOOD (  13.07  )
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

RnJvbTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgoKVGhlIHJldF9mcm9tX2tl
cm5lbF90aHJlYWQoKSBiZWhhdmVzIHNpbWlsYXJseSB3aXRoIHJldF9mcm9tX2ZvcmsoKSwKdGhl
IG9ubHkgZGlmZmVyZW5jZSBpcyB3aGV0aGVyIGNhbGwgdGhlIGZuKGFyZykgb3Igbm90LCB0aGlz
IGNhbiBiZQphY2hpZXZlZCBieSB0ZXN0aW5nIGZuIGlzIE5VTEwgb3Igbm90LCBJLkUgczAgaXMg
MCBvciBub3QuIE1hbnkKYXJjaGl0ZWN0dXJlcyBoYXZlIGRvbmUgdGhlIHNhbWUgdGhpbmcsIGl0
IG1ha2VzIGVudHJ5LlMgbW9yZSBjbGVhbi4KClNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcg
PGpzemhhbmdAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJp
dm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpUZXN0
ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAgfCAx
MiArKystLS0tLS0tLS0KIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyB8ICA1ICsrLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5
LlMKaW5kZXggYmMzMjJmOTJiYTM0Li41Y2NlZjI1OTQ5OGQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2VudHJ5LlMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwpAQCAtMTMy
LDcgKzEzMiw2IEBAIFNZTV9DT0RFX0VORChoYW5kbGVfZXhjZXB0aW9uKQogICogY2FsbGVyIGxp
c3Q6CiAgKiAgLSBoYW5kbGVfZXhjZXB0aW9uCiAgKiAgLSByZXRfZnJvbV9mb3JrCi0gKiAgLSBy
ZXRfZnJvbV9rZXJuZWxfdGhyZWFkCiAgKi8KIFNZTV9DT0RFX1NUQVJUX05PQUxJR04ocmV0X2Zy
b21fZXhjZXB0aW9uKQogCVJFR19MIHMwLCBQVF9TVEFUVVMoc3ApCkBAIC0zMzQsMjAgKzMzMywx
NSBAQCBTWU1fQ09ERV9FTkQoaGFuZGxlX2tlcm5lbF9zdGFja19vdmVyZmxvdykKIAogU1lNX0NP
REVfU1RBUlQocmV0X2Zyb21fZm9yaykKIAljYWxsIHNjaGVkdWxlX3RhaWwKLQltb3ZlIGEwLCBz
cCAvKiBwdF9yZWdzICovCi0JbGEgcmEsIHJldF9mcm9tX2V4Y2VwdGlvbgotCXRhaWwgc3lzY2Fs
bF9leGl0X3RvX3VzZXJfbW9kZQotU1lNX0NPREVfRU5EKHJldF9mcm9tX2ZvcmspCi0KLVNZTV9D
T0RFX1NUQVJUKHJldF9mcm9tX2tlcm5lbF90aHJlYWQpCi0JY2FsbCBzY2hlZHVsZV90YWlsCisJ
YmVxeiBzMCwgMWYJLyogbm90IGZyb20ga2VybmVsIHRocmVhZCAqLwogCS8qIENhbGwgZm4oYXJn
KSAqLwogCW1vdmUgYTAsIHMxCiAJamFsciBzMAorMToKIAltb3ZlIGEwLCBzcCAvKiBwdF9yZWdz
ICovCiAJbGEgcmEsIHJldF9mcm9tX2V4Y2VwdGlvbgogCXRhaWwgc3lzY2FsbF9leGl0X3RvX3Vz
ZXJfbW9kZQotU1lNX0NPREVfRU5EKHJldF9mcm9tX2tlcm5lbF90aHJlYWQpCitTWU1fQ09ERV9F
TkQocmV0X2Zyb21fZm9yaykKIAogLyoKICAqIEludGVnZXIgcmVnaXN0ZXIgY29udGV4dCBzd2l0
Y2gKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3Byb2Nlc3MuYwppbmRleCA4OTU1ZjI0MzJjMmQuLjQ2ODA2ZDVkMTBmYSAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Nlc3MuYwpAQCAtMzQsNyArMzQsNiBAQCBFWFBPUlRfU1lNQk9MKF9fc3RhY2tfY2hrX2d1
YXJkKTsKICNlbmRpZgogCiBleHRlcm4gYXNtbGlua2FnZSB2b2lkIHJldF9mcm9tX2Zvcmsodm9p
ZCk7Ci1leHRlcm4gYXNtbGlua2FnZSB2b2lkIHJldF9mcm9tX2tlcm5lbF90aHJlYWQodm9pZCk7
CiAKIHZvaWQgYXJjaF9jcHVfaWRsZSh2b2lkKQogewpAQCAtMTc0LDcgKzE3Myw2IEBAIGludCBj
b3B5X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsIGNvbnN0IHN0cnVjdCBrZXJuZWxfY2xv
bmVfYXJncyAqYXJncykKIAkJLyogU3VwZXJ2aXNvci9NYWNoaW5lLCBpcnFzIG9uOiAqLwogCQlj
aGlsZHJlZ3MtPnN0YXR1cyA9IFNSX1BQIHwgU1JfUElFOwogCi0JCXAtPnRocmVhZC5yYSA9ICh1
bnNpZ25lZCBsb25nKXJldF9mcm9tX2tlcm5lbF90aHJlYWQ7CiAJCXAtPnRocmVhZC5zWzBdID0g
KHVuc2lnbmVkIGxvbmcpYXJncy0+Zm47CiAJCXAtPnRocmVhZC5zWzFdID0gKHVuc2lnbmVkIGxv
bmcpYXJncy0+Zm5fYXJnOwogCX0gZWxzZSB7CkBAIC0xODQsOCArMTgyLDkgQEAgaW50IGNvcHlf
dGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwgY29uc3Qgc3RydWN0IGtlcm5lbF9jbG9uZV9h
cmdzICphcmdzKQogCQlpZiAoY2xvbmVfZmxhZ3MgJiBDTE9ORV9TRVRUTFMpCiAJCQljaGlsZHJl
Z3MtPnRwID0gdGxzOwogCQljaGlsZHJlZ3MtPmEwID0gMDsgLyogUmV0dXJuIHZhbHVlIG9mIGZv
cmsoKSAqLwotCQlwLT50aHJlYWQucmEgPSAodW5zaWduZWQgbG9uZylyZXRfZnJvbV9mb3JrOwor
CQlwLT50aHJlYWQuc1swXSA9IDA7CiAJfQorCXAtPnRocmVhZC5yYSA9ICh1bnNpZ25lZCBsb25n
KXJldF9mcm9tX2Zvcms7CiAJcC0+dGhyZWFkLnNwID0gKHVuc2lnbmVkIGxvbmcpY2hpbGRyZWdz
OyAvKiBrZXJuZWwgc3AgKi8KIAlyZXR1cm4gMDsKIH0KLS0gCjIuMzYuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
