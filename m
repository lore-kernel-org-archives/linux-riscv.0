Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6D6606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 01:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mXdg110i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pzeNjKFM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HTGQyC9GnTdYkVEgP7FprVNcvW55JqcyqWHLPfCuKEk=; b=mXdg110iHEmpQUfVSFCRImUsSf
	HWXcY5LYyJhl4nF8wr5yr/rj2Y4rxQWHHZn38aUzsWyJGWfv0ZWQyMgZYqtYgApnhpZWkhrScB5XH
	DC9y47opt+e8rv3gI/ADOwejGBf2zcCK2kXR5CvcumH/s5RpYJBylNlWAJPrUlTnlr/Gq5l840j/C
	fDIEHX/tkq5bQ34MbdXTBbAYDfrdmKbffQVFcAWf/lptVblHVPupcig+FEMGTv8U8XLTy7diPMp7R
	tqx0pzaQM0fRnmNJKHpyln2YnqySE7vCFOsFSHH+81VWHVPHpr8iEDFmD4tj/y9r3pd8guUf+SAjz
	0tcBdUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTqgu-0000000Ac8j-2YgE;
	Thu, 19 Nov 2026 01:11:56 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTqgr-0000000Ac80-2o6O
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 01:11:55 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so2198483a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 17:11:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795050711; cv=none;
        d=google.com; s=arc-20260327;
        b=KdEfDvGU/WxMitz5Ertw7grPVql1bCIEht5OcGinrddKS7v3dVFMR0wwiWfMYzK3P0
         b7F2HSKbmeU56sQ0KKKI8IEDqWtFBB/3TdRnLGAp2+1utArzxZ+ThUnlz0z0hLVWISFF
         VFCMRVBViD2zeQwktKSbNsCUyEjmzJqeSpG6DN3O4qugjFTEN3CCLqaka2rsF77XqlV/
         27fRNlLJYQFVme4kgXPCI2lekQ+VDGkbGM7o63LWiUtyIqrjf5YHfMXajbd0YSbggNV6
         KI0LLfZcMA94jG5eq6+FPZkcnlb+KPqhamBvr+5JdomvhM0ZP75ur3yfeP2LchMQYNSh
         zG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFbr6eHg9xAfwCJ+yPPFuSKuvOw6SPSCEC37J1T1mfY=;
        fh=S/kLdLdPEmzZOksmRcuMwUSjzJdZA+WlxMY/A4CLLrw=;
        b=Q4bxAhIIHcvrIGsysw1c1eC0AxJOi3C3wuJ86bKsFo8eV4Q0iVYWFuEjBj3260FfW/
         IkkGvabMQBtpnMPxXB6GoOdPb54eBRBs2FyjQRB7gFD1i8yiCKD2DShyknXbl7IjnM+J
         6cbugFq+E/8n9lXQjmggAIcDgN5YavLwOmFp29NfO1saryfSAt9eRmNhREM4fyMjzir5
         sOduyhZd8oYmUxcWKqeO/FJtPJnmPwslpxD+2ujY4WaJnD47QMuKNhw3WEylQ5ZsFr8M
         hy63vgZgbqHr5ejgwlVsRoReCpV+qjUFxJHI6XiPne7ZH3TIPRxqpfvuYe3gr2Jf8FSc
         HSuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20260707.gappssmtp.com; s=20260707; t=1795050711; x=1795655511; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zFbr6eHg9xAfwCJ+yPPFuSKuvOw6SPSCEC37J1T1mfY=;
        b=pzeNjKFM6U2pU1I++iMvwEq3aG90EGBp2wY4VeixBT0mCaLnzK6FAWeX3jmHocycT3
         OYi+lmJ8kHsmEAYeN/XcqU3Sq/e8LjaLIf7Lb6lE33FHqsT7U4vsnRuHMLXC+7N1cmPp
         hJ3dIgIcUZe/JegnzIB8KWsD0KrIbQqr+KGiAM7J9VGU36hxSS1S2td8bJNE+R/P6OSk
         xwnAFHFUaduk+4GDajBbAG/ps2SmIbn8R33qkD1Ijgs1uMNd1qhqIktiYRXzhWwHb6c6
         68NETkPsRtbwKksu5dCsE7uYFuXl6leLqTTISqm96Q6DrVTeRlMOmQvwfQ960bf+3ZaF
         qPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050711; x=1795655511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFbr6eHg9xAfwCJ+yPPFuSKuvOw6SPSCEC37J1T1mfY=;
        b=CoL0wyOF9wr8nS0r/mlsXjxwqKJWV4Bs+K6/2fnMJ2ZQQ4SCynRZ/Yr4sr3yfVEJzI
         7FJ24lLjXBUh+qk6ZmQ38nZmceYwhng1G3Wjgnbg/YOETJB1B/xLpbALSLDGikgQAst2
         wt0WQJBJzGweWZBOapLxEkO6mm4LI38EPS7OmmhGcqRu0Vp2LdJV+SwdaNbjUy8ffAjK
         FMIqHESbhYOLPfLY7ngL3F1Wl9xcpeoMuX0xWWBiDjuQri2WxRTCxG1xiHHT91SoTQqA
         Yt6AtfCpUpSqPLIJX6/hwWh0CK/O59ZBvnYLgrVlu4km7g5OBD1KEq0/YWcAuX6PcWrj
         cyIw==
X-Forwarded-Encrypted: i=1; AL+hErEpFLCFWcJVKU7EMF2ajUMYG4FEja2rmyUjerDFqc2sORLoF95QKSIzEr6jErIqcEWNqxgl53oKvS3Rqw==@lists.infradead.org
X-Gm-Message-State: APuU4Z99OH7dh07PoPC4VTN4povQnqj+Fu3phD6DcLW1aUW2ZOWNoYSd
	W4XYt0oOvCTpvq6yagYwA+h/MJcfaPYTsousoKuJZR1PiUsdQrNsgvn4SMHviOcLGMYR3Jk6OnS
	oReqK0u1ph/XtqL5Rzgv5iwBUxrM2QfqPNIHeCrhDsw==
X-Gm-Gg: AYBFou0rpjlqw9/tz10XXCUhJC/EijDdVGj0a6EhlMdtXkY9gjE/28tsG43oD6L82uv
	96t1AdL5p9gTwOp3zZcauB6kbPVDHTDLzuqzqFiuUEbO2m4rf4OtfLihr0xGmkg6K+hDmp77Uel
	Lg8hhebVMJyBapnTjuBmqKLimtbBILihnBkaWyoyniZCqyaeMx98Hfgl4TsL4OJN2wC9KxJmDe7
	nla3L0gKb/xAe1nbFWzmN39oww07MZXfSe5Y3MMWhzCN/FyceSD+Cdz9fwY0bhg4aipDAdasNcV
	5f1g9nB5NrNTTe5fT1BB8Y6qZrtx+1AIoOEO8a5m7OmmUWtSDC35s9+YHRGOL8p7xLcG8eO7Hh8
	7z/1eAK5JHy9EI5tfiSb+OrvUL9dyDy+ngq6pFO4yW0LdQ1aTv8E2wwLi4vfj+396vrQaYLjaaR
	7nqciHtwi2xAjtm7zfh4yFmL6qyQ==
X-Received: by 2002:a05:6402:1d4c:b0:6b9:c43e:19df with SMTP id
 4fb4d7f45d1cf-6b9c43e2326mr963366a12.41.1795050710871; Wed, 18 Nov 2026
 17:11:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118013729.576325-1-xiyou.wangcong@gmail.com> <av3Q8pAVt6nb-RBc@kernel.org>
In-Reply-To: <av3Q8pAVt6nb-RBc@kernel.org>
From: Cong Wang <cwang@multikernel.io>
Date: Wed, 18 Nov 2026 17:11:38 -0800
X-Gm-Features: AclHuK87b_shKwat8_ZEwNyuTNtkbEeG4EoWTL7eT71aa9I3nE0EPfXoTHuPeag
Message-ID: <CAGHCLaTb1HhPXMqakdErKhrCTWcQ0arqKDbo++vp5jOkmjQ93w@mail.gmail.com>
Subject: Re: [PATCH] riscv: kexec_file: Verify the signature of Image files
To: Mike Rapoport <rppt@kernel.org>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, kexec@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_171153_820277_C0A90B1C 
X-CRM114-Status: UNSURE (   6.97  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgODoyM+KAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIbW0sIGxvb2tzIGxpa2Ugd2UgYWxyZWFkeSBoYXZlIHBsZW50
eSBvZiB0aG9zZS4gSSBiZWxpZXZlIGJlZm9yZSBlbmFibGluZwo+IHRob3NlIG9uIHJpc2N2IHdl
IG5lZWQgc29tZXRoaW5nIGxpa2UgdGhpczoKClllcywgdGhhdCBpcyBhIGdvb2QgY2xlYW51cC4g
SSBhbSBoYXBweSB0byByZWJhc2UgbXkgcGF0Y2ggb24gdG9wCm9mIHlvdXJzLgoKUmVnYXJkcywK
Q29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
