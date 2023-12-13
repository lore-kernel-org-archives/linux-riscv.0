Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BB2C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 00:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8XgqXupPJH+ZMpJwYX5OnnE34DpviR7qrI0T0KslNY=; b=T+0Y40Y+A88x20
	w4LfChDCsrOPt93T7WbSjvwHAL6rYIY5ihc/vDx2Uczz6nFGxQCK9infA+hObt2nClpZKFceqCWCO
	LYIO+VCuRjT9OLXe7UUqV/MQy3hAbucJ78If1TMGtJxiSKgoXsz9VBvYBckTWmvUpGqPYGyrLcEH/
	+q91lD0uGf0usp7Gsd20FRwAphM2yq6S1YqVd9WPxOBc4OsyYSlxVWfe4JsHNW9zP5HnCoh6DLzgu
	+Wrq/L0Qd5F2KDRqGb6nvkYYihM5XMRiOzl7y1b/zNVGeiAiPYWV5DKasf+BsMTvBqUswGsoNFIn6
	H36XuAgDCVfgn0AnmQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDSh-00DEZI-0q;
	Wed, 13 Dec 2023 00:50:55 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDSc-00DEXm-36
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 00:50:52 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-dbc8b07ceddso2674372276.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 16:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702428649; x=1703033449; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsP6D8T5vC4K0WLWKELqerL/h2k2GCGETaeygCJbK5E=;
        b=K4YKwR+qXETWay2efnY1oRCX82ddylWsUYQDzEIGicop0i93+pDPN496EA59FdceJL
         JZm70PPB8ve9TSpmd0cDE4H6UMzqcU0CbDhDGgtd7TtB1OGl3W9BVBrpHdW1Ck+aKbsR
         UySMIP6lvTzl4zTUpNFz7qbGgcA0hbtT35lUKF5uwIYEX7YX6aAZqeZrYWwc3jx24yXB
         7GnBnAuo7kPVCT2Im0dDV0KtwItW5YnDpZmSAW70U67tiDU59lEg2m5wAAO0lAvHNKJ2
         DPvRhZl7NdqQIXy7CvloeNcsheYmOMGy5HOu0H3J6GWdlQuDhytpcKxRi0eGUWn8xFqN
         u8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702428649; x=1703033449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsP6D8T5vC4K0WLWKELqerL/h2k2GCGETaeygCJbK5E=;
        b=DAM1O40wvNM/qKJL20L+hotbEdcSh8qq8idZh19Ab+yoDCZVDGI0NUfp3QNUXH/UIG
         ySHHUVeho7ZDr37AZrGoMvWfcvBavkQF7gTe/6GTNrF9QhHifM7rCq32jaMKWT/27KjX
         Xi7M9iGVRfhskw+pFIvUgY0+WKY0AAwxLyCQ5VSNDzeSnoZVF7H6u2Av6o2z+HzugOgz
         n0jPSGBePtbbKOeKVeZwGcnhN08/dGUEFuJyiOxSfSMAQQ/LIgiW7z0C6H8+v0JBSV4v
         QFzVUrt1S5A8f+ZC8sHuCUpmh7RCb3PR3Mxk+mmIkmia5pY1qlk2pHgM28Ckg//jw84M
         DXpw==
X-Gm-Message-State: AOJu0Yz5CHwJY4ClM+Y+OH1LqZlIr3LvfsqcVX8IsZKO2eLJNZwh8GPb
	mfAyOp4DuwZVE59AUOx24y2S4C+IQr84IJkzSh920g==
X-Google-Smtp-Source: AGHT+IFg4hZCse8kzky6Y9/DVuxOtpUz/g7bXwrKJ9hF5mEV7x9P3i3TYFdKJnIuamiDiHUwxXUn6NjiQwKNsCzwWqw=
X-Received: by 2002:a25:8051:0:b0:db7:e91c:eb1d with SMTP id
 a17-20020a258051000000b00db7e91ceb1dmr4411297ybn.102.1702428649654; Tue, 12
 Dec 2023 16:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-2-201c483bd775@kernel.org> <CAKC1njSC5cC_fXnyNAPt=WU6cD-OjLKFxo90oVPmsLJbuWf4nw@mail.gmail.com>
 <d708b493-267a-4418-be91-9bde6b2cf50c@sirena.org.uk>
In-Reply-To: <d708b493-267a-4418-be91-9bde6b2cf50c@sirena.org.uk>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 12 Dec 2023 16:50:38 -0800
Message-ID: <CAKC1njSQPO8ja7AkTzQ724hhSsGjchH9dLbbH9LXP0ZiKj-zPQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/39] prctl: arch-agnostic prctl for shadow stack
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_165051_200910_2D7B1558 
X-CRM114-Status: GOOD (  23.60  )
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

T24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgMTE6MjPigK9BTSBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgMTE6MTc6MTFBTSAt
MDgwMCwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+ID4gT24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMTo0
M+KAr0FNIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+ID4gKy8q
Cj4gPiA+ICsgKiBTZXQgdGhlIGN1cnJlbnQgc2hhZG93IHN0YWNrIGNvbmZpZ3VyYXRpb24uICBF
bmFibGluZyB0aGUgc2hhZG93Cj4gPiA+ICsgKiBzdGFjayB3aWxsIGNhdXNlIGEgc2hhZG93IHN0
YWNrIHRvIGJlIGFsbG9jYXRlZCBmb3IgdGhlIHRocmVhZC4KPiA+ID4gKyAqLwo+ID4gPiArI2Rl
ZmluZSBQUl9TRVRfU0hBRE9XX1NUQUNLX1NUQVRVUyAgICAgIDcyCj4gPiA+ICsjIGRlZmluZSBQ
Ul9TSEFET1dfU1RBQ0tfRU5BQkxFICAgICAgICAgKDFVTCA8PCAwKQo+Cj4gPiBPdGhlciBhcmNo
aXRlY3R1cmUgbWF5IHJlcXVpcmUgZGlzYWJsaW5nIHNoYWRvdyBzdGFjayBpZiBnbGliYwo+ID4g
dHVuYWJsZXMgaXMgc2V0IHRvIHBlcm1pc3NpdmUgbW9kZS4KPiA+IEluIHBlcm1pc3NpdmUgbW9k
ZSwgaWYgZ2xpYmMgZW5jb3VudGVycyBgZGxvcGVuYCBvbiBhbiBvYmplY3Qgd2hpY2gKPiA+IGRv
ZXNuJ3Qgc3VwcG9ydCBzaGFkb3cgc3RhY2ssCj4gPiBnbGliYyBzaG91bGQgYmUgYWJsZSB0byBp
c3N1ZSBQUl9TSEFET1dfU1RBQ0tfRElTQUJMRS4KPgo+ID4gQXJjaGl0ZWN0dXJlcyBjYW4gY2hv
b3NlIHRvIGltcGxlbWVudCBvciBub3QgYnV0IEkgdGhpbmsgYXJjaCBhZ25vc3RpYwo+ID4gY29k
ZSBzaG91bGQgZW51bWVyYXRlIHRoaXMuCj4KPiBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBm
b3IgYXJtNjQgYW5kIHRoZXJlZm9yZSBBUEkgZm9yIHRoZSBwcmN0bCgpCj4gaXMgdGhhdCB3aGF0
ZXZlciBjb21iaW5hdGlvbiBvZiBmbGFncyBpcyBzcGVjaWZpZWQgd2lsbCBiZSBzZXQsIHRoaXMK
PiBtZWFucyB0aGF0IHNldHRpbmcgdGhlIHN0YXR1cyB0byBzb21ldGhpbmcgdGhhdCBkb2VzIG5v
dCBpbmNsdWRlIF9FTkFCTEUKPiB3aWxsIHJlc3VsdCBpbiBkaXNhYmxpbmcgYW5kIHdlIGRvbid0
IG5lZWQgYSBzZXBhcmF0ZSBmbGFnIGZvciBkaXNhYmxlLgo+IFdlIGhhdmUgdXNlIGNhc2VzIHRo
YXQgbWFrZSBhY3RpdmUgdXNlIG9mIGRpc2FibGluZyBhdCBydW50aW1lLgoKQSB0aGVvcmV0aWNh
bCBzY2VuYXJpbyAobm8gY3VycmVudCB3b3JrbG9hZHMgc2hvdWxkJ3ZlIHRoaXMgY2FzZQpiZWNh
dXNlIG5vIHNoYWRvdyBzdGFjaykKCi0gVXNlciBtb2RlIGRpZCBfRU5BQkxFIG9uIHRoZSBtYWlu
IHRocmVhZC4gU2hhZG93IHN0YWNrIHdhcyBhbGxvY2F0ZWQKZm9yIHRoZSBjdXJyZW50CiAgdGhy
ZWFkLgotIFVzZXIgbW9kZSBjcmVhdGVkIGEgYnVuY2ggd29ya2VyIHRocmVhZHMgdG8gcnVuIHVu
dHJ1c3RlZCBjb250YWluZWQKY29kZS4gVGhleSBzaGFkb3cKICBzdGFjayB0b28uCi0gbWFpbiB0
aHJlYWQgaGFkIHRvIGRvIGRsb3BlbiBhbmQgbm93IG5lZWQgdG8gZGlzYWJsZSBzaGFkb3cgc3Rh
Y2sgb24KaXRzZWxmIGR1ZSB0bwogIGluY29tcGF0aWJpbGl0eSBvZiBpbmNvbWluZyBvYmplY3Qg
aW4gYWRkcmVzcyBzcGFjZS4KLSBtYWluIHRocmVhZCBjb250cm9scyB3b3JrZXIgdGhyZWFkcyBh
bmQga25vd3MgdGhleSdyZSBjb250YWluZWQgYW5kCnNob3VsZCBzdGlsbCBiZSBydW5uaW5nCiAg
d2l0aCBhIHNoYWRvdyBzdGFjay4gQWx0aG91Z2ggb25jZSBpbiBhIHdoaWxlIHRoZSBtYWluIHRo
cmVhZCBuZWVkcwp0byBwZXJmb3JtIHdyaXRlcyB0byBhIHNoYWRvdwogIHN0YWNrIG9mIHdvcmtl
ciB0aHJlYWRzIGZvciBzb21lIGZpeHVwIChpbiB0aGUgc2FtZSBhZGRyIHNwYWNlKS4KbWFpbiB0
aHJlYWQgZG9lc24ndCB3YW50IHRvIGRlbGVnYXRlCiAgdGhpcyByZXNwb25zaWJpbGl0eSBvZiBz
cyB3cml0ZXMgdG8gd29ya2VyIHRocmVhZHMgYmVjYXVzZSB0aGV5J3JlIHVudHJ1c3RlZC4KCkhv
dyB3aWxsIGl0IGRvIHRoYXQgKGN1cnJlbnRseSBfRU5BQkxFIGlzIG1hcnJpZWQgdG8gX1dSSVRF
IGFuZCBfUFVTSCkgPwoKUGxlYXNlIG5vdGUgdGhhdCBJIGFtIG1ha2luZyB1cCB0aGlzIHNjZW5h
cmlvIGp1c3QgZm9yIHNha2Ugb2YgZGlzY3Vzc2lvbgpBbmQgZG9uJ3Qga25vdyBpZiBzb2Z0d2Fy
ZSB3b3VsZCBiZSB1c2luZyBpdCBpbiB0aGlzIG1hbm5lci4KCj4KPiBQbGVhc2UgZGVsZXRlIHVu
bmVlZGVkIGNvbnRleHQgZnJvbSByZXBsaWVzLCBpdCBtYWtlcyBpdCBtdWNoIGVhc2llciB0bwo+
IGZpbmQgbmV3IGNvbnRlbnQuCgpTb3JyeSBhYm91dCB0aGF0LgpOb3RlZC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
