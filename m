Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0463110ED676
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Q0t0s42G3Q+1XqtWiiu7jbTS3Tn58o0aPxR9XFw7+I=; b=X2P0XRx6iPlP7+
	+N95MuVsPYUWCEE+LLJMfTYdzscKyz5Bh1ihk14OTWGyF8qLcj7uyVQd3p3kO1s5SL/TLjldEe9Dt
	Q3mwRQ5iQvp0XqQFuTuGHklYtB/4EiEcSQOqYriCUvYOa5rAVpwMRhvzvbcwvJ5CPHG8GAhX1bYCo
	eqv0IGkTPZgD9ll4kpMhMsnN12j9LvbPe4USL4n6eVLFD1JHhi4xJ3Sbz4Lkrqc0cHKq3u8SJMHPw
	RQ8CyxkLPqZtx+tQQYNEBI3WmCvJoP7J7hhNsQhbXcfkNW3M40hfxzWFey8+5NlBkb5ftb77sYHZ7
	wfwwEHUzK9tXG2WAEexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66vW-00000007Oac-3fP9;
	Fri, 27 Mar 2026 13:08:38 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66vT-00000007OZk-1xUB
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 13:08:37 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-67df51b26ddso1353720eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 06:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774616914; cv=none;
        d=google.com; s=arc-20240605;
        b=KzTz4zdtF6Gp4lCSCpKfA6n7T50O0R7Mg+SBPmvc93wWGYxcZcZr0KA5TVqnu2KDqP
         a5k5Wi2wPpX3qPNyGPYvgwo+FOEr2bKUOhDR3Z4jVY8MbZU2x0x13dFSXSSf51rCmTKe
         Fggg0i4V+f85i4lAZay+IRd6iS2TaQyYt+vCRYIbuziIQM72LmgFfckuTHsuZJvgffHp
         ogE96uDmU7rT6A3EWHeTTLVzYf7RxBMZ6wH2PudQK693Jg4CDh5vfoH5J5fFgRXuPSV2
         ZycykFNV8g9kpLNEywuSp1gS0HVKoIKhvtUzDQ9l7vsI0zMnSGEBLcfiZh9T7R2CmgYv
         ldJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmbMPpAvEXl89b9DDmueCespLqdFhwnm0SegHcujUGk=;
        fh=512WHaBDY2HB1CNAwpbR2MUXT5s7kGH1rwXmBD7HXM0=;
        b=TyaHyAZqRYwRBnynEwg5MLhadouB7+x4Ov5wdbLKuma2fVkMare4a1pFcnq3kGoCW4
         GkHq25bhnGkxQIxTEf8MuhkZuLkrnvmsy3mEznEMc4vyJhJUbj7OHc/zC11Q52r1ym/2
         /xsFZYMVlBWUEPZ1h9LvRb58Olda9Ku9Ze8hji1XrNbMzLqNXE4Ex3gyxdXM7TXrFEmD
         nNLNqbGBLeHDOjHO7bJpUdARBqQgchG09qnoTvdlUpWQI2eDUESPx9v4zW2nkrM8EiDj
         EHEDypLjB71Z6baj4L79JwcdOmamzhbtPYy12TYEV9wIuhyQ7yeYYUZrZ4WFW4XVLTa9
         VtVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774616914; x=1775221714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmbMPpAvEXl89b9DDmueCespLqdFhwnm0SegHcujUGk=;
        b=TNjvg1iGK8bht+e0aibEMzDfJl+8EPpoccop9bjC/Ln/wWJ/T5gH0cLq+IvPmj+4Zc
         +KlQOIc78MKidyTs/Q7dMbpqH2G1ucBJSwwKSkaUNG18sR8qVRVyrI1cokdG6DUghJpv
         hcc3V1DAE/EvSMO7T7z+cWMBVsMwgZRPM0ElHhoODh3ZBIOjpG1x7kFEFg9jopi4ZgI9
         iw0+nUb/3xbqXbLfKBjHHB9BbxrXEg5c+g4FLheARfQ/1HLBs4hshcX0p4/1jIoOWwaL
         QAJn5aYHIkew3zhQGQaCaOt7gUsv+W9xnVHHTG33HWmNvTtIk6HdQEPd4w7X9yvZ7N+E
         DG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616914; x=1775221714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmbMPpAvEXl89b9DDmueCespLqdFhwnm0SegHcujUGk=;
        b=MPvGgD8HUuYn66mNxXQIxXYIlQQ12R55fsaUn/Sq7CdFlfHUM/Q4jcKU35+vG72Xym
         AsgGhSRYKBJ50dXqm9iHII4ObKHP1krZYMmXdIrwLyRxVAylXuZjp0qBJWeXC5AHRdW3
         lGb6jKNzInonl0HhDl1Eqmo7PXo2gajQxYZxFOCP/LpmoJ7/On9n9rw7JdlQWEN3J7Kl
         dYgGNgSFk5A3C3isIa4wAgvdq0dHbmNe5APa+Btshp1SFbffHhucyGhDU4laVCGagmw2
         zNfdExZSy7DehD2kHJZlFfQyffAolCVgeliJK73jRpC7shfgNZFojHyYhCEZhoeG7rBV
         K9QA==
X-Forwarded-Encrypted: i=1; AJvYcCWjeC09gt56dc7QNu9xNaJY62Iz9Kmd3cECskZ2YneyU+aqMXSkxXtxIY5/p4jeuI+0gjaa4iT89069cg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJqrxx5hNBrhj7pd0wWRqfRIstrbHZtlNASF/w4MRx+nkX49Lq
	OkzrYgMitzxagcep9wkm01T5dpJdbcTGArtnoIIiVhhlZdoYpHJvcK7N6h+zIb9B+GvWOMl9RDn
	Pjs3ItoMs4Rr4392LDW5162C/Duhqs7VPq94/GiQmvA==
X-Gm-Gg: ATEYQzx/g8dRu/il+5Os1NkrbFUL0hjL1cCgScHfXtF7Sb7h/dggMrAj9yfrRydUrOB
	Wo8fJvMlRZg7Hc0Z1xUXphnGDrJHojpvAV5RA/fNHsBiHinPaOSRKTgXhB3QqOOZtzPIJHrBgJX
	ERTb+lhCaq3WAUUH6rbHWwL9M+0l/yk8b6H3EEL2gZLQaRSNpDMnUVKfUEtboBdfhmmrFGdTtO7
	Ja8jGkmzobpBgcFZ5Pmb2VX5UQRJ2v78rFNVobUU8qMZ8aW6zuxZRJaM93ZgBbnHVLaEkgtCiFf
	72KLq/JsC3VoeREBbapVYblHjkG8JTIFBJsBhbm2f/+lMKuXGHNN5fyAJiyDkME5iDiD/HNQQYB
	z7PW9h2mfgFmwMB8rJNKC2tRhnw==
X-Received: by 2002:a05:6808:1446:b0:467:3f4:907a with SMTP id
 5614622812f47-46a8a61bfc9mr1080873b6e.52.1774616914163; Fri, 27 Mar 2026
 06:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260311231833.13189-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260311231833.13189-1-osama.abdelkader@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 18:38:22 +0530
X-Gm-Features: AQROBzDaiuO8uOhM7V4GcN6kMarCQKRgIGfEl9WOxz4H4Jv6lFJN2-pYAWK-4is
Message-ID: <CAAhSdy0kGyp6APnB25v47jqNeaFj59ff15Ja-Kyj=9AXMVQSsg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_060835_510521_1AFC0368 
X-CRM114-Status: GOOD (  14.88  )
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

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgNDo0OOKAr0FNIE9zYW1hIEFiZGVsa2FkZXIKPG9zYW1h
LmFiZGVsa2FkZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IFdoZW4gc2FkZHJfaGlnaCAhPSAwIG9u
IFJWMzIsIHRoZSBnb3RvIG91dCB3YXMgdW5jb25kaXRpb25hbCwgY2F1c2luZwo+IHZhbGlkIDY0
LWJpdCBhZGRyZXNzZXMgdG8gYmUgcmVqZWN0ZWQuIE9ubHkgZ290byBvdXQgd2hlbiB0aGUgYWRk
cmVzcwo+IGlzIGludmFsaWQgKDY0LWJpdCBob3N0IHdpdGggc2FkZHJfaGlnaCAhPSAwKS4KPgo+
IEZpeGVzOiBjMmY0MWRkYmNkZDcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IFNCSSBQTVUgU25h
cHNob3QgZmVhdHVyZSIpCj4gU2lnbmVkLW9mZi1ieTogT3NhbWEgQWJkZWxrYWRlciA8b3NhbWEu
YWJkZWxrYWRlckBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3
LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy4x
CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gdjI6Cj4gLSBiYWxhbmNlIGJyYWNlcyBwcm9wZXJseQo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIHwgNyArKysrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBp
bmRleCA0ZDhkNWU5YWE1M2QuLmVjMGMxNTcyNmRhOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IEBAIC00
MjMsMTEgKzQyMywxMiBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X3NuYXBzaG90X3NldF9zaG1l
bShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgcwo+ICAgICAgICAgc2FkZHIg
PSBzYWRkcl9sb3c7Cj4KPiAgICAgICAgIGlmIChzYWRkcl9oaWdoICE9IDApIHsKPiAtICAgICAg
ICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiArICAgICAgICAgICAgICAg
aWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHNhZGRyIHw9ICgoZ3BhX3Qpc2FkZHJfaGlnaCA8PCAzMik7Cj4gLSAgICAgICAgICAgICAgIGVs
c2UKPiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBz
YmlyZXQgPSBTQklfRVJSX0lOVkFMSURfQUREUkVTUzsKPiAtICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKyAgICAgICAgICAgICAg
IH0KPiAgICAgICAgIH0KPgo+ICAgICAgICAga3ZwbXUtPnNkYXRhID0ga3phbGxvYyhzbmFwc2hv
dF9hcmVhX3NpemUsIEdGUF9BVE9NSUMpOwo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
