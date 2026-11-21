Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DC606A320
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nz0s6wAz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zM1DEjFl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UsIX9/xgJ/AJbdgNzCVTp3vgqAH5axBQIjxp0lxFVt8=; b=Nz0s6wAzmkVf/FRmUTEh7Fhs5f
	tBbZTVktM1K4GlryvYJ9ghRc84a6zESEDj89Gb7uHHStcVdst8316gjHZRaU12Wrjy2T3PpogbQa/
	Ooyq4zdLGtOukoD8SK37vDuqgNiXqBoj3YqldRdczEJDgh9PRDTXAYwmZKWqyrUqO/88sM9knXV9t
	7aotGmq2f3aKcHGpqfri8n+3i657UOHFAxUpVeFn8RoFtCE8b7+iRtzBeKW3nSE3gIUZbV1OaS3i0
	3aZMbaud3nGprGClj0FIrII6R+7cyhlVxswzinfmNAWg0RXZbcJwAH7jIikn5TxMCYnvUHME62Kxr
	CBGPQEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpLd-000000001rT-3w4n;
	Sat, 21 Nov 2026 17:58:01 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpLb-000000001r7-0GrB
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 17:58:00 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8b4e04eda5aso14553037b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2026 09:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795283877; cv=none;
        d=google.com; s=arc-20260327;
        b=faampoa7kSwANbbKL1cIc79aQTUPIuK+YgjqRXdXe8C9vtPB6pW3QpK7x+u1/uzUZI
         fycTdMDT53N4boB1QnVrLdifke2bh6xkgFh61WSgSRfoTKM328R98eFzZ232KPVzczA0
         8zYYoUTkYQnR8TIXmqkuQ3JHN+5qLELfoSRWjVtvm6wqbYuc4KhW/r9pvCwPr6IZDIp/
         8YgTfycbfEnu42DKRZVY4dJdeHqut32bJKmeS9qzwUbKmiPSnDG9ULix3z0on1BrydPf
         Kgi8POUm98ukcM6ha2mlG+ozoRwtGkZuG8RNVMSV3pJLKQGRtES7yKGPxrIe/oO1090B
         i2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
        fh=PQNUnQadWm0epDjeW9elSAmtCGj+XaG0YcY3kFTODDE=;
        b=o16UOZR+vxxJ+sFo1Mmhnz08opEH0MNNbt23sCTdF/MKnnkcJCkr9awFBcV35LB97Y
         NRvL6viv8l5RKpnAziuarYzH1eAvHfwmfW5LEgn9cXC9zJds6gEI1TtJNVdWsscbLlIC
         2RZDifpOxILx+Z+i1Pa07fEN8P7ZI5nAe6tCSooQ8wTnk80I9BNgjlk/mAfxhH8L0DLJ
         NfMMCHJQf8+ZK85fGGP5ZrUrJw8yTZ3reEo1kTcy3DBUp8sMyXDSC1ox03XobQr1VwBB
         b/ZaM+Fwws7N+eNzpGxWyc5VdlWoRSNIgqfT3XjpjJEv5j/bFA02uikvnlT21FQ7EsGi
         Tv4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795283877; x=1795888677; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
        b=zM1DEjFlDfGh6at6YMSQOUNmPdG1y8x1ibhtrrHOR7bsUc/1g5UT1SgcNQU8nl0IBR
         YNlt+ONW2y6frcA/lJLxly5BOXgdq5eniFCFpjCJfesDAQyCO/fzunKqSyXRDTaLXw79
         ruI0VZFS4mZ9xJj2TRiiv2WUHfwlJxnFOL5Urr5fLv6ImoE1D2Rnt9GTqSqbxbENdlPR
         DOiWwlGrEm0kaEW7aDscIT05AaDYUuhZRGB4sUZBwSB3g5VO2D2abQCkY5Vgt3ZEG5i7
         eeHmCAyrx6Z+nXkdT0gNT5Z4AUnpbp+DGQL6jFG/Nd8skPleM6aKSy0yM4SCwFaxJyuh
         A/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283877; x=1795888677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
        b=1SfB9kdvVC+ehGfb0QIHVvEXeOeuZT9NJ5e5i1YYZmbj1L1wC0SYOOzaB2ydWqCxJX
         Wx9MmdJDKaU46o82yJIaEKNZuKbM5CmANaeC0X4bcyYgmOuq5f+eS04qA+mGeWiROA05
         cAG7JnpmdYwNwylt78I9CNHpycmWptnREEEFfdCdogKForn8jPgO7uh2vq1sDqGV4a/S
         6FO1lYhSaYvJsKpOlS/INnk20crE+G7mbYfs8Uy+tUmE2HECIg56ujwZgMu/EUzO9QLP
         Ti99Z++la+U7fDvsBpZ0locWX5Xz2LmPdx0kpIkLdhSn//AsCHT24SSBdNX2CJgodg5a
         ZPgg==
X-Forwarded-Encrypted: i=1; AL+hErF2YwBuYiglcUhm7mqXX7GHxRBhiZ5LG4fvPtEWbxs5wGbFOlnlKU2mfMsRBPM9qyDyQ/I2yjeFEZsRSw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+CVZs2xvT8gPtSjvhVOj6Spk+ccUp4FkLE2jzPRPz8foY7TUDA
	u6JI1iXSQ01ki9fPp8/UmSd6vctuAfNuYNEXiOiFXA62CKrF7WsMsmiS52Tqi8Fscm2eRntymDX
	2fyawvLPxjdbld1hYbQmH0gEvVbidVfY=
X-Gm-Gg: AZFdTZce8dz8RUognsY17cMvTYo09ZtCW2Qw63B4iwke3HxaDmlwkgkoLmjded7LMkZ
	ncczN/Q65RJb0poJJYZcnshd0g2y1TvWTJRa72xidTbrQbfm9amSw3TFJ7h979z6JX8nTliwyfW
	J/hm+oijTI01CojX2A4fVZd7YJ6TQ+40aGG8O+V10vrSzq40yCPdTLw0y+LRN9WbPq2iQhguR88
	oJDXEpM+xUbxAbKX2hoGTsdK4H+Gh38H+oauT+pFNw6lG7ymvS91WZu0Cfekdc30/Df26QCQTLG
	fW7sHjBFN4cnfHQqDpbQdmjQFGkFTI+DqPsBNQGQrL0cfsmbm7e3D8cOk66TsYiBf4dJ4EtLq76
	f2tU687FlpDQilK/QJvM+pQcOFyO/BxAkYwkead4=
X-Received: by 2002:a05:690c:9b0b:b0:8b0:702f:2a69 with SMTP id
 00721157ae682-8b520500588mr37750997b3.39.1795283877275; Sat, 21 Nov 2026
 09:57:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-img-pm-autosuspend-v2-1-427689f6f2f9@linux.spacemit.com>
In-Reply-To: <20261111-img-pm-autosuspend-v2-1-427689f6f2f9@linux.spacemit.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 22 Nov 2026 02:57:46 +0900
X-Gm-Features: Aa3M54o-NmMelfecL-8e1chO9NJSddT-nsp3zPaudeABWyPskoPrY6_ORqOpIUA
Message-ID: <CAKbEzntsUc4D3Nvxfphy5yApWG+sGsx7VF1cYd3SLSoZKhiteA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/imagination: re-check firmware idle state before
 runtime suspend
To: Baihui Liang <liangbaihui@linux.spacemit.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_095759_132006_5BA555E9 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQmFpaHVpLAoKT24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgNjoyOeKAr1BNIEJhaWh1aSBMaWFu
Zwo8bGlhbmdiYWlodWlAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IHB2cl9wb3dlcl9k
ZXZpY2VfaWRsZSgpIHJlamVjdHMgcnVudGltZSBzdXNwZW5kIHdoaWxlIHRoZSBmaXJtd2FyZQo+
IGhhc24ndCByZWFjaGVkIFJPR1VFX0ZXSUZfUE9XX0lETEUuIFRoZSBQTSBjb3JlIGRvZXNuJ3Qg
cmVzY2hlZHVsZQo+IGlkbGUgbm90aWZpY2F0aW9uIGFmdGVyIHJlamVjdGlvbiwgc28gbm8gZnVy
dGhlciBwbV9ydW50aW1lX3B1dCgpCj4gYXJyaXZlcyBvbiBhbiBpZGxlIEdQVSBhbmQgdGhlIGRl
dmljZSBzdGF5cyBwb3dlcmVkIGluZGVmaW5pdGVseS4KPgo+IE1vdmUgdGhlIGlkbGUgY2hlY2sg
aW50byBwdnJfcG93ZXJfZGV2aWNlX3N1c3BlbmQoKSBhbmQgcmV0dXJuIC1FQlVTWQo+IGFmdGVy
IHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSBzbyB0aGUgUE0gY29yZSByZXNjaGVkdWxlcyB0
aGUKPiBhdXRvc3VzcGVuZCB0aW1lciBhbmQgcmV0cmllcyB1bnRpbCB0aGUgZmlybXdhcmUgaXMg
aWRsZS4KCk15IHVuZGVyc3RhbmRpbmcgb2YgU2FzaGlrbydzIHBvaW50IChjb3JyZWN0IG1lIGlm
IEknbSB3cm9uZyk6CgotIHB2cl9yZW1vdmUoKTogbXVzdCBwb3dlciBvZmYgdW5jb25kaXRpb25h
bGx5Ci0gcnVudGltZSBzdXNwZW5kOiBwb3dlciBvZmYgb25seSBvbmNlIGlkbGUgKC1FQlVTWSBv
dGhlcndpc2UpCgpTaW5jZSByZW1vdmUgZ29lcyB0aHJvdWdoIHRoZSBzdXNwZW5kIGNhbGxiYWNr
LCBpdCBjYW4gbm93IHNraXAgdGhlCnBvd2VyLW9mZiBvbiAtRUJVU1kuCgpNb3ZpbmcgdGhlIGlk
bGUgY2hlY2sgaW50byBydW50aW1lIHN1c3BlbmQgbG9va3MgcmlnaHQgdG8gbWUsIHNvIGhvdwph
Ym91dCBrZWVwaW5nIGp1c3QgdGhlIHBvd2VyLW9mZiBsb2dpYyBpbiBhIGNvbW1vbiBoZWxwZXIs
IGNhbGxlZCBieQpydW50aW1lIHN1c3BlbmQgYWZ0ZXIgdGhlIGlkbGUgY2hlY2sgYW5kIGJ5IHJl
bW92ZSBkaXJlY3RseT8gUm91Z2hseToKCiAgcHZyX3Bvd2VyX2RldmljZV9vZmYoKSAgICAgICAg
LyogZndfZGlzYWJsZSArIHBvd2VyX29mZiAqLwoKICBwdnJfcmVtb3ZlKCkKICAgICAgcG1fcnVu
dGltZV9kaXNhYmxlKCk7CiAgICAgIGlmICghcG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKCkp
IHsKICAgICAgICAgIHB2cl9wb3dlcl9kZXZpY2Vfb2ZmKCk7CiAgICAgICAgICBwbV9ydW50aW1l
X3NldF9zdXNwZW5kZWQoKTsKICAgICAgfQogICAgICBwbV9ydW50aW1lX2VuYWJsZSgpOyAgICAg
IC8qIGJhbGFuY2UgZGV2bV9wbV9ydW50aW1lX2VuYWJsZSgpICovCgotLSAKVGhhbmtzLApHeWV5
b3VuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
