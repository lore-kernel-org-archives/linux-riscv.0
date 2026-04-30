Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3C5FF886F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 23:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxIPd/HnVFehJnxZiFs0Is9DDXpwnJDTDQAtg9VbTg4=; b=D3O6TuXx6vjagO
	w9YYByxumwiEn5anRien0DFHKZfxvPDDH4SnAuPSRCQFwP0QC8NHmaYJtodW2ZxC1wtHJz+veB7Dk
	KcHC1hrJswW8GfQgTQTZNeipnNXqUTy3g6I20D8TZi1Y25UgICgIbynl4ttKQPMrXjfLT8aRMqpTl
	u8jJvHBoQ7SZHtT0f3UYfxkypSjL/6pcWS6qn6KxLy36qeI3qbEcua0tnR/I4UYMZ4MH1hrA2t1ux
	16dmgsl8F9CX0UoXz/XupUYAJN1HiYtZIYqiKua8TzZeZ68gJxdI8fCaGmY1v3AXZ49+LR1Pr/ika
	lIMIoQFpoGJge7enJ8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIayj-000000067uv-1gmS;
	Thu, 30 Apr 2026 23:39:33 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIayh-000000067ud-10K6
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 23:39:32 +0000
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso1032201b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2026 16:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777592370; cv=none;
        d=google.com; s=arc-20240605;
        b=G8swVTXAs7jc5FwwTeXmzbovCwUYeXeMSBdilfCgP6o3TaU6bdaq2nzlDdlSzg2LlE
         wtRS8EHHlukTBYR+TxZe9t9o1vug7Idsxq8jmcBcOSQ8PFJbUpFKVBlWt6qhIThlf7cu
         G+1gMJDymW2Vtv2TfEadNENnUzYXUVH/wkn1G1WytuX3K8FeoD4mmUmEShmQOEGTb787
         oNeDkQfsG8hLlHOfzAoCGuwbhx4t5aAGu190hH7VkdBug+K60FAGrQ9SEX5cQfZJ42Js
         VW6kgz05St/8erZTpwG8vTH0wL/xSqPRtrrSdzGUm9AKuTIAYBZ4dkLGL9xWmVlJJrmd
         ZCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Cx7+rB8zqSG95RXNt1o2BO0Tl2Wkf5l4gUT3xnB+hHE=;
        fh=w+T0KxkM0U2nANPNw0PoS9U6LxyR2gp7M2czA6veH+0=;
        b=Hp/89jGfWeJLlO1CG17GvgC0SF54bfXEOEREQoQLJxeZRy5rSHuaDATClemArXWAM5
         lUT557P7Qhi9buOZJb+xUB0/q5+VQswQAvK4mzsBYLwEuB82D2IkrhUo6jZhP5VC6Ztt
         PBKHRBOeFId9GVWQDr1FwnVpF7AtJzS4FgDkU3D8lRWpu6+7ZYpa97bvUDR9nEEf42E3
         cwj/pp7OREoofknL+fZ8PaNTsfNVDDyzBQU3JEt7c9j+8z9d3cUS1dEAGzPg3w7icla9
         mdZwEakT4nlOfRLzOmK+tvIILWToWuvUVpScmphFTvgrcxPz2gGvE/GFsfKnPm1Nh/eY
         1h5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777592370; x=1778197170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cx7+rB8zqSG95RXNt1o2BO0Tl2Wkf5l4gUT3xnB+hHE=;
        b=PfEj7f2Q67cVrrv2cXU5sboJppLd3dxNNr5WrKNrL/x42QH4f6K1E8OW5c/40LmVgb
         H5llF3MGVD+rEjy/55JazNpfcF/nlZPrg1bb8Hu9MRGMY4CXJnR/haD2FC/e28DKbT0n
         x8gh4p0D3JEul/79Wtt/De5WJFQvhuWNaQFQIk+TBWkVm8Vu9J2A6budwp7UEGYkiQnG
         rZDj4ODY5LwQm/RmH76X1OAx4n08J+tBXO/80BrUAlxLsVrGOrLr+jd6kmqWXVjfZg6+
         qHaTAXKmNjjRZPcA3S5TYEwZ2tyGp+/PZYRK6R7fA3KOK2VcEppllwzp4JcDguu+GK8P
         TW2w==
X-Forwarded-Encrypted: i=1; AFNElJ/b08CYMttLROrSdt3vRsxLIpXTbvHW17D0+/7zO4pA9GupUcHwGAq9Blr9VQfaHUCJ9IBFPqZqVYGH6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/nqRsj+pV5U57EkUz/45dJvgdE7IPxu3N9qn6EgXD4ma33Keo
	fSuonI/9H2q4+EODss4pVCqhNmx+aeH1/+AywaPdjmjrsa5UViNjf7oKNG7UaPFU2bFb9lHG8lC
	BVtksrUpbSJSS9mUD7CoA0H3hjUNH8Ps=
X-Gm-Gg: AeBDievw7KEa2cBoBhhdhKjBXxTgexlQTCn+On2waKCO3teZDZA6VuKCuLMeekMEV/o
	FoQol2cM8ITacqHj/mlAY/vs9+Zh+wngW0T97DfB5uvlhIT+d1vteqWTQg5hvQIm2Btm3k/PPm6
	2EosZlLEN5SztthXCFj12Q1C7F9syl0LqIMUMIjT6FIn8+MWG11NbP1jOqF3/pTWnwrFneNugA6
	OJjGhGH4kZZw+gwI4G5FzaJDHh7hoOTWRm6rCnlI70YT4D0K8hVTJlli68XcEMRhyjLJNyMOrc6
	JS2xadzDuespAvhRSSMHK2Au+MlUgix5D6xQkEztBTxECwstkQA=
X-Received: by 2002:a05:6a00:8e01:b0:82f:111:61d3 with SMTP id
 d2e1a72fcca58-8351a5d8a70mr605450b3a.44.1777592370104; Thu, 30 Apr 2026
 16:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260430035259.3402954-1-domibel@debian.org> <20260430-celibacy-semifinal-db18fc2fe553@spud>
In-Reply-To: <20260430-celibacy-semifinal-db18fc2fe553@spud>
From: Dominique Belhachemi <domibel@debian.org>
Date: Thu, 30 Apr 2026 19:39:19 -0400
X-Gm-Features: AVHnY4Lb3mTlguWudJ5JLYvLTGmkfRrZutT0S-FVnOll2zRH3BK2VJv2JDK67Eo
Message-ID: <CAAvaLCzS0YAYYsz0T2+DW198grBL2dM0dZdqcyb6ZumwQtNSbQ@mail.gmail.com>
Subject: Re: [PATCH] cache: sifive_ccache: Add StarFive JH7110 SoC support
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_163931_281433_A92778E9 
X-CRM114-Status: UNSURE (   9.18  )
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

T24gVGh1LCBBcHIgMzAsIDIwMjYgYXQgMzoxNOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBXaGF0J3MgdGhlIG1vdGl2YXRpb24gZm9yIGVuYWJsaW5nIHRo
ZSBub25zdGFuZGFyZCBjYWNoZSBvcHMgaGVyZT8KPiBUaGUgZHJpdmVyIGFscmVhZHkgYmluZHMg
d2l0aCB0aGUgZ2VuZXJpYyBzaWZpdmUgY29tcGF0aWJsZSBvbiB0aGlzCj4gcGxhdGZvcm0sIGFu
ZCB0aGVyZSdzIG5vIHBlcmlwaGVyYWxzIGN1cnJlbnRseSBzdXBwb3J0ZWQgb24gdGhpcwo+IHBs
YXRmb3JtIHRoYXQgbmVlZCBub24tY29oZXJlbnQgRE1BLgoKSSBhbSB1c2luZyB0aGUgaW50ZWdy
YXRlZCBCWEUtNC0zMiBHUFUgb24gdGhlIEpINzExMCB3aXRoIE1lc2EgYW5kClZ1bGthbiBvbiBh
IHN0b2NrIERlYmlhbiBzeXN0ZW0gKHJ1bm5pbmcgaGVhZGxlc3Mgc28gZmFyKS4KVG8gZ2V0IGEg
c2ltcGxlIHdvcmtpbmcgc2V0dXAsIEkgaGFkIHRvIHBhdGNoIHRoZSBwb3dlcnZyIGRyaXZlcgpt
b2R1bGUsIHRoZSBkZXZpY2UgdHJlZSAoYm90aCBhcmUgZWFzaWx5IHBhdGNoYWJsZSBvbiB0aGUg
U0JDKQphbmQgdW5mb3J0dW5hdGVseSwgdGhlIGtlcm5lbCB3aXRoIHRoZSBwcm9wb3NlZCBjY2Fj
aGUgY2hhbmdlLgoKU2VlIGUuZy4KaHR0cHM6Ly9naXRodWIuY29tL2RvbWliZWwvbGludXgvY29t
bWl0LzcyNDBkOTk1NTcxYTEzZDI4OGI1Y2M1MjA5N2M0ZWJiNWIzMzlmOWIKaHR0cHM6Ly9kb2Nz
Lm1lc2EzZC5vcmcvZHJpdmVycy9wb3dlcnZyLmh0bWwKClRoZSBnZW5lcmljIGJpbmRpbmcgYWxv
bmUgZG9lc24ndCBoZWxwLCBzaWZpdmUsY2NhY2hlMCBtYXRjaGVzIGJ1dCBkb2Vzbid0IHBhc3MK
UVVJUktfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTLCBzbyByaXNjdl9ub25jb2hlcmVudF9yZWdpc3Rl
cl9jYWNoZV9vcHMoKQppcyBuZXZlciBjYWxsZWQuCgpzdGFyZml2ZSxqaDcxMTAtY2NhY2hlIGlz
IGFscmVhZHkgZG9jdW1lbnRlZCBpbgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2FjaGUvc2lmaXZlLGNjYWNoZTAueWFtbCAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
