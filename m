Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2D606A325
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3RWuehEx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RwBBmxiB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HbjhmVYj3Ye4B2rNB4B8/Bi7hVyD/SfhtPcGbQPZ82s=; b=3RWuehExxQLAGivaMZ87oadgRM
	OkPVDTcKXAwUj/s9J4CsenbUlBo79iuBUUX8BZs6bgRfRSLDHQMVTATFXSQEIJ2nMGBxE/hWDhFfR
	JSSjgNaCUqg4Agk418j+nHtmCido0lUDw8ONmV2nsL7kd+AcemVxJJmAnnjAOZZCXQb8LzL6VaOBB
	nYr0Wcz8Oqvka8zvTrvD2JFeogwW/Mo1ubKebyesUYEtmSXwd9gxjh0xAnxnk5e9BM+edVHh4qEc9
	53QyiTe+XvRinZdM5HJgttQekQpfYW04Zh6JcH4yUBsfemiUZ8T/oMd94kBDI8OY3eViEPEHpduiw
	MokiawWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGbp-0000000GYQg-3oiy;
	Fri, 23 Oct 2026 14:51:05 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGbl-0000000GYPz-3xrr
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 14:51:03 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6df5e315bd1so630322eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 07:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792767057; cv=none;
        d=google.com; s=arc-20260327;
        b=Sbl8xw/qZmIAMgWlw90ml1Q9rCHhe2a2oTneB/aQJLIsvtJSnX6L+ST0aWE6YmHFa/
         VeDrdODLUEKFlXUwgFzVkR41FaChpTKYMLOtUlt7VDba0KVoO5jFY3KXcCGk3yAbxXyY
         1nZDLvqzf2AwEij1Tq0Wm1cR+2xONzupZjo7HXXEiDy4u6cDxQ7+QfuJnt0xMVuRkuCJ
         cTrQgxsK48zYY2iB34tht3YivS2JariENYBzmYm8IcD0bFYZTUyMvRczAogvTkOH1WvO
         4xvhEeYeURA1uwWzuHGBkaewOZUdsR68dmqeju8rhdvpYRzfrGmT995hDVaVrj7IiZUl
         M0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uNpmEP5c8VeQ+q4DNjLNP6E92iAqlUq5JqczOkkWF1A=;
        fh=EOJYR8TWFKQlgV+j8THRb//TK8WSjNCx2PfobSW1eiE=;
        b=AQEz69tX9Q6342xiEb47ANRsycSax8AlSMuej8wvuz+gB5ke2mtTZQ6yQL0xUrtutn
         c82rx64RJ+Ot2m86VyOXNl0ZJLnRp/Xa18HeYU+6TeebWBH9jRGr0dhkjAdijvoEXG2S
         sGpvY+15ozqZ5sbeVpnRDhUIdbMpe5WRKa0mJXOTFwreTCc+lnL/scsUoxS7phSxl45F
         r6qD8YMiLVHiDHUySiVdCR5eeXl0RIiJUGDwY9doL+VrUA5zejz9AGLOBKT1ByX0x0C/
         orN+yEjg0BUewoJzwrbTZLu8kyEHiOTNr3vRDDIUwyBDSnpe2egBPZarPKXUCt0kqGe7
         PdAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792767057; x=1793371857; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uNpmEP5c8VeQ+q4DNjLNP6E92iAqlUq5JqczOkkWF1A=;
        b=RwBBmxiBZIpsIP/6biaMBZY1x975cGp08nZ9f6EWa/UR4PzOwt1mj0PExrLFJe4XxB
         AToyfphxZmDDR23rbBn48xclx+/rqVH9zIfdqc/DxYs5jHFvs1JllZpxJH8RxW05R8+i
         NKF9oxn/nJKrJqiPFykdo720/GreMH/kDla3aPDmfV7OjaxT1MvwyiUNoQlea8FTSF1i
         RFUl5uimgzFy7kh5aWEFzdjG+StFiXhwqcyCS3UJxOPIwhlUa7u7+gZQCMVZEGesGGXm
         8JLPVxZiIJ9FTxXEb2ZsO8dVUmLhgQn9qZ5VqLuat6YcikcM+Zubx7wBEWsWFv/yxbQr
         JADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767057; x=1793371857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNpmEP5c8VeQ+q4DNjLNP6E92iAqlUq5JqczOkkWF1A=;
        b=UQXmI9KVSGQKQbcQkGnWhdx/exliSBcBHbZfTk+UY5Zc0Px55lBT2jTKTFRY8W2qOE
         jiS5OelKshpnieCPqLqDhRolJ9uxUe3lO05m02Mhoq7z9nvPE3Ev/oJpTzQzW4LUZGhM
         pT1ebbR8m+wd2QkNY7mkkysrzd8rAbQssxQ2ExmPgJILLfLOgujl0TKt9vZUh++7kOvy
         D0f0sBEafQKWgao8DBxaScoqd5A23/u5qwu9dQEV02iTcCyd0qStjyfCvO+X0IeUdAUD
         a16hC3yc9EBZ3CjbIYNgF5J3DoI81HSZcRU6wFQWg2gETLOuOOOMVaLTGA2xZI1E/n6w
         nekA==
X-Forwarded-Encrypted: i=1; AKwUvByHDBANFMSVR1n6T0Y/5rHj97qicYPhX8XdEu0d6AexiosYTBbLgH2DVT5Q5qP1fMR1D1KORF9q+fnkZA==@lists.infradead.org
X-Gm-Message-State: AFq9FYI1ZZeAWXRMS0t0O1JxYIKH2JYXgKGYz0XrGS7rpfjcSdcFy55y
	OkOFp73Izr1Mo/kz4wJj0HvGRQPfWGmvdq3ps4CmDrUBSxJt29pCfthLqLUCPdXQpiAI2QbJl/4
	5bk+YZjmCsxK6rfVMAScU78xFheHUTTygBfO2k7iG/g==
X-Gm-Gg: AYBFou2uGwwCCSbzYFU9L66EXN65Iz8e4HxCOeheuSW4ynn4dYP8hJA60myhTsoH2fk
	0bOmQ/ZIVgR8PX0hErujmbg5fq0PeksqKLz/uvadES3yq4wYGkutxTmnFCAtOAcNDkgzy4ezsBL
	LlxQgmZoAo+Dd6EpJLxFDy1m9ju1uu/D1oOXNT20apAGOjCRbwq4FFYirAqZxhpVaFWV1nbtrQi
	KxiGErt9l42klYmzcX2eMo3uZpMCJCwSYmVXKcXAyrzg63bf1VeS91/0PHWdRgHQ8XslhhW+VrC
	Kyl10zE9l69RD8WoquEWWe3mjXDOBjzrImVHTBkWs90eHzEBl5iglDK8TKd/jpE/4rVk006pZm0
	v3YshmzInOzsfoY8tD8X8vuEh1iJWdI3nNjUsZUc=
X-Received: by 2002:a05:6820:8597:20b0:6da:29e4:35b1 with SMTP id
 006d021491bc7-70b88a1cc11mr1189394eaf.31.1792767057470; Fri, 23 Oct 2026
 07:50:57 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022083212.84721-1-cuiyunhui@bytedance.com> <atqL1ScMLUg2bM_E@Tao-Chiu's-Mac>
In-Reply-To: <atqL1ScMLUg2bM_E@Tao-Chiu's-Mac>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 23 Oct 2026 22:50:45 +0800
X-Gm-Features: AclHuK-Du3zkiCNN0XfX5mHWLP_GAo3ZNGA4wWa5MNg3SjlqsiC6OFMlcOn_PSQ
Message-ID: <CAEEQ3wkS2niNwzS25jhvT55fSDWF_anYkLW5PZS0MsvUOq2vBQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: Fix SR_SUM leakage across context switches
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	zong.li@sifive.com, wangruikang@iscas.ac.cn, debug@rivosinc.com, 
	qirui.001@bytedance.com, guoziyi114@gmail.com, samuel.holland@sifive.com, 
	ben.dooks@codethink.co.uk, cyrilbur@tenstorrent.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_075102_028692_FD5C5FFB 
X-CRM114-Status: GOOD (  33.04  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQW5keSwKCk9uIEZyaSwgT2N0IDIzLCAyMDI2IGF0IDY6MTnigK9BTSBBbmR5IENoaXUgPHRj
aGl1QHRlbnN0b3JyZW50LmNvbT4gd3JvdGU6Cj4KPiBIaSBZdW5odWksCj4KPiBPbiBUaHUsIE9j
dCAyMiwgMjAyNiBhdCAwNDozMjoxMlBNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gX19z
d2l0Y2hfdG8oKSBzYXZlcyB0aGUgc3N0YXR1cyB2YWx1ZSBvZiBwcmV2IGFuZCByZXN0b3JlcyB0
aGUgU1JfU1VNIGJpdAo+ID4gb2YgbmV4dCB3aXRoIGNzcnMuIEhvd2V2ZXIsIGNzcnMgb25seSBz
ZXRzIGJpdHMuIElmIHByZXYgaGFzIFNSX1NVTSBzZXQKPiA+IGFuZCBuZXh0IGhhcyBTUl9TVU0g
Y2xlYXIgaW4gaXRzIHNhdmVkIHN0YXRlLCB0aGUgb2xkIFNSX1NVTSBiaXQgcmVtYWlucwo+ID4g
c2V0IGluIHNzdGF0dXMuCj4gPgo+ID4gVGhpcyBsZXRzIG5leHQgcnVuIHdpdGggdXNlciBtZW1v
cnkgYWNjZXNzIGVuYWJsZWQgZXZlbiB0aG91Z2ggaXRzIHNhdmVkCj4gPiBTUl9TVU0gc3RhdGUg
aXMgY2xlYXIuCj4gPgo+ID4gVXNlIGNzcnJjIHRvIHNhdmUgdGhlIHNzdGF0dXMgdmFsdWUgb2Yg
cHJldiBhbmQgY2xlYXIgU1JfU1VNIGZyb20gdGhlCj4gPiBsaXZlIENTUiBiZWZvcmUgcmVzdG9y
aW5nIHRoZSBzYXZlZCBTUl9TVU0gc3RhdGUgb2YgbmV4dC4gVGhpcyBrZWVwcwo+ID4gcHJldidz
IFNSX1NVTSBzdGF0ZSBpbnRhY3QsIHdoaWxlIHByZXZlbnRpbmcgaXQgZnJvbSBsZWFraW5nIHRv
IG5leHQuCj4KPiBEbyB5b3UgaGF2ZSBhIHdheSB0byB0cmlnZ2VyIHRoaXMgYnVnIG9uIGV4aXN0
aW5nIGNvZGUgb3IgaXMgaXQgdGhlIGNhZQo+IHdoZXJlIHRoZSBidWcgY291bGQgaGFwcGVuIGJ1
dCB3ZSBuZXZlciBleHBlcmllbmNlZCBpdCBpbiByZWFsIGxpZmU/Cj4KPiBJZiBJIHVuZGVyc3Rh
bmQgY29ycmVjdGx5LCB0aGlzIGNhbiBvbmx5IGhhcHBlbiB3aGVuIHRoZSB1c2VyIGFjY2Vzcwo+
IHJvdXRpbmcgdm9sdXRhcmlseSBtYWtlcyBhIHNjaGVkdWxlKCkgY2FsbCBtaWQtZmxpZ2h0LCBv
ciBhIGNvZGUgZm9nZXRzCj4gdG8gdHVybiBvZmYgU1JfU1VNIHJpZ2h0IGFmdGVyIGFuIHVzZXIg
YWNjZXNzIGFuZCBoYXMgYSBsaXZlIFNSX1NVTSB3aGVuCj4gY2FsbGluZyBzY2hlZHVsZSBzb21l
IHRpbWUgYWZ0ZXIuIEJvdGggY2FzZSBzaG91bGQgYmUgYSBidWcgYXMgU1JfU1VNCj4gc2hvdWxk
bid0IGxpdmUgaW4gdGhlIGtlcm5lbCBjb2RlIHRoYXQgaXMgbm90IGRvaW5nIHVzZXIgYWNjZXNz
Lgo+Cj4gQSB0cmFwLWludHJvZHVjZWQgY29udGV4dCBzd2l0Y2ggd291bGQgaW50ZXJydXB0IGEg
Y29kZSB0aGF0IGhhdmUgU1JfU1VNCj4gc2V0LiBIb3dldmVyLCBzaW5jZSB0aGUgYml0IGlzIGNs
ZWFyZWQgYXQgZXZlcnkgZXhjZXB0aW9uIGVudHJ5LCB0aGUKPiBjb250ZXh0IHN3aXRjaCBjb2Rl
IHdvdWxkIG5vdCBzZWUgYSBsaXZlIFNSX1NVTS4gU2VlaW5nIHRoZSBiaXQgc2V0IGluCj4gdGhp
cyBjYXNlIG1lYW5zIHNvbWV0aGluZyBpcyBub3QgdHVybmluZyBTUl9TVU0gb2ZmIHByb3Blcmx5
Lgo+Cj4gSSBhZ2dyZWUgdGhhdCB0aGlzIGlzIHRoZSBiZXR0ZXIgd2F5IHRvIGhhbmRsZSBTUl9T
VU0gaW4gYSBjb250ZXh0IHN3aXRjaAo+IGJ1dCBhdHRhY2hpbmcgYSBjYWxsIHRyYWNlIG9yIHN0
YXRpbmcgdGhhdCAiV2UgaGF2ZSBub3QgY2F1Z2h0IHRoaXMgaW4KPiByZWFsIHdvcmxkIGR1ZSB0
byAuLi4iIGluIHRoZSBjb21taXQgbWVzc2FnZSB3b3VsZCBiZSBhcHByZWNpYXRlZC4KPgoKSSBk
b24ndCB0aGluayB3ZSBuZWVkIGEgImJldHRlciB3YXkiIHRvIGp1c3RpZnkgdGhpcy4gVGhpcyBp
cyBhIGJ1ZyBpbgpfX3N3aXRjaF90bygpLiBPbmUgcG9zc2libGUgcGF0aCB0byBoaXQgaXQgaXMK
dXNlcl93cml0ZV9hY2Nlc3NfYmVnaW4oKSAuLi4gbG9jYWxfYmhfZW5hYmxlKCkuCgpUaGFua3Pv
vIwKWXVuaHVpCgo+IENoZWVycywKPiBBbmR5Cj4KPiA+Cj4gPiBGaXhlczogNzg4YWE2NGMwMWYx
ICgicmlzY3Y6IHNhdmUgdGhlIFNSX1NVTSBzdGF0dXMgb3ZlciBzd2l0Y2hlcyIpCj4gPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3Vp
eXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRy
eS5TIHwgNiArKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5T
IGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+ID4gaW5kZXggNjFiN2E3NzE2Njk3MS4uNjI4
Yjg1ZTM5MTVhNyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiA+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiA+IEBAIC00NDMsMTUgKzQ0MywxNSBA
QCBTWU1fRlVOQ19TVEFSVChfX3N3aXRjaF90bykKPiA+ICAgICAgIFJFR19TIHMxMCwgVEFTS19U
SFJFQURfUzEwX1JBKGEzKQo+ID4gICAgICAgUkVHX1MgczExLCBUQVNLX1RIUkVBRF9TMTFfUkEo
YTMpCj4gPgo+ID4gLSAgICAgLyogc2F2ZSB0aGUgdXNlciBzcGFjZSBhY2Nlc3MgZmxhZyAqLwo+
ID4gLSAgICAgY3NyciAgczAsIENTUl9TVEFUVVMKPiA+ICsgICAgIC8qIFNhdmUgYW5kIGNsZWFy
IHRoZSB1c2VyIHNwYWNlIGFjY2VzcyBmbGFnLiAqLwo+ID4gKyAgICAgbGkgICAgczEsIFNSX1NV
TQo+ID4gKyAgICAgY3NycmMgczAsIENTUl9TVEFUVVMsIHMxCj4gPiAgICAgICBSRUdfUyBzMCwg
VEFTS19USFJFQURfU1VNX1JBKGEzKQo+ID4KPiA+ICAgICAgIC8qIFNhdmUgdGhlIGtlcm5lbCBz
aGFkb3cgY2FsbCBzdGFjayBwb2ludGVyICovCj4gPiAgICAgICBzY3Nfc2F2ZV9jdXJyZW50Cj4g
PiAgICAgICAvKiBSZXN0b3JlIGNvbnRleHQgZnJvbSBuZXh0LT50aHJlYWQgKi8KPiA+ICAgICAg
IFJFR19MIHMwLCAgVEFTS19USFJFQURfU1VNX1JBKGE0KQo+ID4gLSAgICAgbGkgICAgczEsICBT
Ul9TVU0KPiA+ICAgICAgIGFuZCAgIHMwLCAgczAsIHMxCj4gPiAgICAgICBjc3JzICBDU1JfU1RB
VFVTLCBzMAo+ID4gICAgICAgUkVHX0wgcmEsICBUQVNLX1RIUkVBRF9SQV9SQShhNCkKPiA+IC0t
Cj4gPiAyLjM5LjUKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
