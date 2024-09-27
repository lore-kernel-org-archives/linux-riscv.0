Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BCFCDD1DC
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 20:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6k2FvGoAl/9bbB4vvfiSi0QLYs9LoOt7f/2O1pwuWE0=; b=Tb+HD6fs34MYqg
	RjtYHfhX+QyQ6yK68a0PY5uJqbjflW2LXaWNdErvkwmvT6uYLK/X8eybXbRai/jISi2R54Oe06fUZ
	nz6IMgGQSsuiH1hugYY+OJTgbrODEnZhXbdzhcWyEHLYIpNApUl+AdyS9bPiVFJRcy39e+NT3F5af
	qh7rKieOAzfbtjG17dmDEPhvUFy6q3Ov3VWEROoq+U6+NBhafgj9C6YRyTPgK1T4CuEtZHtQdOTti
	Xwesbpcsi4eMzzM5Nn1mXJ1xgPz+5j9uTsfgTEZBhe19GRMePpRIQWhkKMAV0TRTJjKNrNsJHnZYa
	BKSyOIC5ma/PYPOD4hMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suHxE-0000000C66D-04tR;
	Fri, 27 Sep 2024 20:52:44 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suHxB-0000000C65G-1xNM
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 20:52:42 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e0a060f6e8so1583407a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 13:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727470360; x=1728075160; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3TYipBZ3m1z5f8qjnQDPEJvDOrdajfpoFzHpH9lwD4=;
        b=Dwyh43bDkZuM1E/njzgHXc5vJrDDNIKZGUGPt6bTaL0rmrMS3+XUL4oTIQLR9SIf5L
         7RTrHrVwDs6J0wdhosJLhjxDiGwdJFrmVNj4GuGjXUp5HDfA9v1unjuy7GuKexMlwCaT
         S0Mk7TolnTzSyN+TDMpTyRsGoM2jqSKfh9E2eEJd8ykRo6fahabYN5qPljVd/ClzoWLQ
         7IPAyEoMigloxH2JI8E7FnHyqODCKbaItUJDMQGAgnW5gVjRScjPuHrDQkGfR9trCbKh
         GJTF7VWCWdOpZ4Cq3euj0QL8s8eU1dO7boL8Jh49Ebj4x6Q4p88O91pXtsmEr7hmDTy0
         RieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727470360; x=1728075160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3TYipBZ3m1z5f8qjnQDPEJvDOrdajfpoFzHpH9lwD4=;
        b=I3W3rCEYypGh6rHbZ5rale1w1VEd42Q0BOWBn/tsgU8jNC6i3IhtSrmrnGuPISXsQh
         6UFw7RQJnrGDlbRQHEHct9+eF8X4/cauYfSqK1AShicg5k37G1yKYn6J2nsq/waOgaGN
         1dr3yEZgWoMDPqNHA96/iKMLEVl7leN4RPYtTq4ZFZiEike/SkCsMrH4NQPi7aErU9/c
         yoSEafziXG37NbMg7JIKYZ4GhcqB7+Eda+r7/c2Yh7M8ulyuDrNH4P9c9Uef1zFKeHqP
         wNbR23p/MQ2Z4RU417BfZfQdmmMhryZ4UlV09IRuyZC60QYhtNmlrtn3eMwCWGtxLWhr
         x1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbpPvexIRzep8Dcd1IbsFBDmYsSbvW9yA4xp79hpgp4IQh3oBzWDkEJTTFyJB8BcwdgyFzhK47SxZydg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyne8Auqo1Xk1aM9MxquthQp8ErgEdwt9eaeh1XKMpkJr2b+VlH
	J+4D5UxUdSxEaEePBXFnrPOPQeTIL0IQxbtZZU7JpkBeL0W5n0fFR9YbQFFDNyJ8FzDH/iU8uGz
	OPttT0luTrA8LeIpvnz91hCDFS4OQSg==
X-Google-Smtp-Source: AGHT+IEFhFMPeqUPjTgmjT1tXk15Ei+RGYN6cAMgWrzG7SlH7HHLGBUE3WXEHcKrs4bM5vI2Sf3P/hNnxP6niY+vBKE=
X-Received: by 2002:a17:90b:3587:b0:2d8:94d6:3499 with SMTP id
 98e67ed59e1d1-2e0b8ed4c1fmr4973657a91.37.1727470360536; Fri, 27 Sep 2024
 13:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240927131355.350918-1-bjorn@kernel.org> <20240927131355.350918-2-bjorn@kernel.org>
In-Reply-To: <20240927131355.350918-2-bjorn@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 27 Sep 2024 13:52:28 -0700
Message-ID: <CAEf4BzaWneXBv401rOdW8ijBTqRn_Ut4FFvhbsPShh5_pjV33A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] selftests: bpf: Add missing per-arch include path
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Mykola Lysenko <mykolal@fb.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_135241_531269_FC7612E7 
X-CRM114-Status: GOOD (  15.48  )
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

T24gRnJpLCBTZXAgMjcsIDIwMjQgYXQgNjoxNOKAr0FNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gVGhlIHByb2dfdGVzdHMgcHJvZ3JhbXMgZG8gbm90IGluY2x1ZGUgdGhlIHBlci1h
cmNoIHRvb2xzIGluY2x1ZGUKPiBwYXRoLCBlLmcuIHRvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS4g
U29tZSBhcmNoaXRlY3R1cmVzIGRlcGVuZCB0aG9zZQo+IGZpbGVzIHRvIGJ1aWxkIHByb3Blcmx5
Lgo+Cj4gSW5jbHVkZSB0b29scy9hcmNoLyQoU1VCQVJDSCkvaW5jbHVkZSBpbiB0aGUgc2VsZnRl
c3RzIGJwZiBidWlsZC4KPgo+IEZpeGVzOiA2ZDc0ZDE3OGZlNmUgKCJ0b29sczogQWRkIHJpc2N2
IGJhcnJpZXIgaW1wbGVtZW50YXRpb24iKQo+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBm
L01ha2VmaWxlIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9N
YWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQo+IGluZGV4IDM2
NTc0MGYyNGQyZS4uZDZhNTNhZmE0NDlmIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2JwZi9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9N
YWtlZmlsZQo+IEBAIC0xMCw2ICsxMCw3IEBAIFRPT0xTRElSIDo9ICQoYWJzcGF0aCAuLi8uLi8u
LikKPiAgTElCRElSIDo9ICQoVE9PTFNESVIpL2xpYgo+ICBCUEZESVIgOj0gJChMSUJESVIpL2Jw
Zgo+ICBUT09MU0lOQ0RJUiA6PSAkKFRPT0xTRElSKS9pbmNsdWRlCj4gK1RPT0xTQVJDSElOQ0RJ
UiA6PSAkKFRPT0xTRElSKS9hcmNoLyQoU1JDQVJDSCkvaW5jbHVkZQo+ICBCUEZUT09MRElSIDo9
ICQoVE9PTFNESVIpL2JwZi9icGZ0b29sCj4gIEFQSURJUiA6PSAkKFRPT0xTSU5DRElSKS91YXBp
Cj4gIGlmbmVxICgkKE8pLCkKPiBAQCAtNDQsNyArNDUsNyBAQCBDRkxBR1MgKz0gLWcgJChPUFRf
RkxBR1MpIC1yZHluYW1pYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAg
ICAgICAgICAtV2FsbCAtV2Vycm9yIC1mbm8tb21pdC1mcmFtZS1wb2ludGVyICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiAgICAgICAgICAgJChHRU5GTEFHUykgJChTQU5fQ0ZMQUdTKSAkKExJ
QkVMRl9DRkxBR1MpICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgIC1JJChDVVJESVIp
IC1JJChJTkNMVURFX0RJUikgLUkkKEdFTkRJUikgLUkkKExJQkRJUikgICAgICAgICAgXAo+IC0g
ICAgICAgICAtSSQoVE9PTFNJTkNESVIpIC1JJChBUElESVIpIC1JJChPVVRQVVQpCj4gKyAgICAg
ICAgIC1JJChUT09MU0lOQ0RJUikgLUkkKFRPT0xTQVJDSElOQ0RJUikgLUkkKEFQSURJUikgLUkk
KE9VVFBVVCkKCkVkdWFyZCB3YXMgZ29pbmcgdG8gc3dpdGNoIHNlbGZ0ZXN0cyB0byB1c2Uga2Vy
bmVsIFVBUEkgaGVhZGVycywgSQp3b25kZXIgaWYgd2Ugc2hvdWxkIGRvIGp1c3QgdGhhdCBhbmQg
dGhlbiBzZXQgdXAgYXJjaC1zcGVjaWZpYwppbmNsdWRlcyBmcm9tIGtlcm5lbCAobm90IGZyb20g
dG9vbHMvKSBhcyB3ZWxsPwoKPiAgTERGTEFHUyArPSAkKFNBTl9MREZMQUdTKQo+ICBMRExJQlMg
Kz0gJChMSUJFTEZfTElCUykgLWx6IC1scnQgLWxwdGhyZWFkCj4KPiAtLQo+IDIuNDMuMAo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
