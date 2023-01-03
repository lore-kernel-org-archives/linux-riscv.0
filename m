Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F4CC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 03:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csO0Y3GUPfLDnKvQJOMIzf1Ctnz+xNobFbpczJe4dJc=; b=oLJPg0Ru7noVY3
	u8TT24tEv69u83d5HiwvLUwofY1vEK6q4Xg6yVQOge6KPwz+Pm/GQcr0n1GE/SHBIRQNzLmWknwHP
	lWeoz/f0iBd3A8GFMqFMyV+GUeqbS2319H9jBabb+50M4V91/hdfNo/FuNeN/zjDfetwd4JZ9mMvv
	EVGVb9RCZjXPAHY6JK7h8r7Jnj8M/G23b4Kg2JP6ADX5KhmYlzCNPLry0RLoa7bTfqgv28p2zFTjK
	afNqp4Yp4kOq6jiGBuXixXSYnGLvVyHv+sBrqBip48Ts18ljwUl57wZYw0f7paLuBZev267+yMese
	N0EKSyGkirKjON40zlXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCY7q-00G7qi-IM; Tue, 03 Jan 2023 03:38:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCY6X-00G7GU-EI
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 03:36:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 23085B80E22;
	Tue,  3 Jan 2023 03:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F08C433D2;
	Tue,  3 Jan 2023 03:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672717002;
	bh=hDdvI2crfVWHl4tVcTo3E7fh7kwInjAKC0UJD8GdyBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ihDf9C9oupoUBXow8RSjgrDh85W/VLBo2TScQeBIv2/SY4h7C394cs3H1/Rph9kJs
	 +MBEv3boyQy4ybo1BQOcUYj0osyxOqFtsK7vcVXCajbvpKfZp0zlPixsSjuPC3arWJ
	 6763bb3Xwq81ptdOx6PEagHwa6camH0GcVrgAHf87wK/x3ZjTRBgu8KYwTmzzhPtPj
	 2wiy7NJ6CBquATxFXG8PM1SH9ElvNl0yv6iFxjmyM2G7Zd/ZOo8cHKO74zuI7X92r3
	 9OiwR83tZJni76qYnz4iLT8520gIpOSgdKeBmrdBNrDyP+RN1clW1yUTPuzlc3lv5E
	 aJKLMPpH1ZR3g==
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
Subject: [PATCH -next V12 6/7] riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork
Date: Mon,  2 Jan 2023 22:35:30 -0500
Message-Id: <20230103033531.2011112-7-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230103033531.2011112-1-guoren@kernel.org>
References: <20230103033531.2011112-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_193646_220535_C8F3EC7D 
X-CRM114-Status: GOOD (  13.38  )
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
LlMKaW5kZXggOTk3ODg2ZmIzN2EyLi4xYTM2ZTMxM2FkYzQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2VudHJ5LlMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwpAQCAtMTMy
LDcgKzEzMiw2IEBAIFNZTV9DT0RFX0VORChoYW5kbGVfZXhjZXB0aW9uKQogICogY2FsbGVyIGxp
c3Q6CiAgKiAgLSBoYW5kbGVfZXhjZXB0aW9uCiAgKiAgLSByZXRfZnJvbV9mb3JrCi0gKiAgLSBy
ZXRfZnJvbV9rZXJuZWxfdGhyZWFkCiAgKi8KIFNZTV9DT0RFX1NUQVJUX05PQUxJR04ocmV0X2Zy
b21fZXhjZXB0aW9uKQogCVJFR19MIHMwLCBQVF9TVEFUVVMoc3ApCkBAIC0zMzYsMjAgKzMzNSwx
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
