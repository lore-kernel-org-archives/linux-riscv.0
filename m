Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F170C88E6F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 16:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+aNlLi06RJuKcbzckVmWDzIGis2ogdNFKPaEw64eEc=; b=zVBSRfJk/RqdI6
	owtu68A29sOAI1LPIBHOLfrcjvrcnzczTRv5fLFJ3DygSH/WcpKMIa2KAHPM1v7wKPC3HiW9j++kO
	yArCgsHh90BOEFbHqFqftIHKGyUhJajWfREVh91h4OdQlxAAIGOaLb6KZqpAJ69b0O7oI+i2OPcSf
	V5F8zSu8G7zFlWn8L4CbP4Di9Ls9FPTPN1XMT5Hs9rc3Hvhdi+9Y+w1FCux7YQMunHlo7IPfqdTHv
	EC2PwF0EOXZIWDijyGAd/gEOjMSjLdhxWBPzUkjZ1tQ8jgKC99rPATumDBM8g9Sq/0gW5YOYFPEPu
	HJJ3r1Ox0xfZYqAhldRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69c3-00000004IPp-0HaW;
	Mon, 14 Sep 2026 16:32:59 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69c0-00000004IOq-17o8
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 16:32:58 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43ac8d1dso12293397b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789403574; cv=none;
        d=google.com; s=arc-20260327;
        b=glPaw/evQz2LKIydxDjFlmmwTw9JDymEdsWdMzi0ErfPgG/zy2rBoEKCNqGYGiLW7/
         o2j4eRRx751Pb8RGJ3Ql2z+loUo5CNBw44lek0k7gHZKGC3Ku4XmJyG3rxyOFZWp9iHN
         AM72LJDgTRkfNa10AImsRm91OxVYFWabOHYHmpk6GL5HaFOeNx75iImVwhlW8d0S2j+B
         2hWClBBMWBLRE6uGMZY/fnXfmnobGKwaUsfZF9jcb5g04otxsRc07fnrhW9fW4g1TJ0H
         WPXyvE9Rm10T83SPcF1FKnedCZPSQPLYoL0P1FiiWA10x5cP4/5Z4rEsR96jjuweYVEh
         EhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U2puunLcCA0Ud8zKAQs4npBTHlIwjTI7Amm7eOrF5FM=;
        fh=C6OuOeOyIwDEaGuW+5EPRiX5SdSqMdd6fEcyiRM4fZY=;
        b=oXunO5S5s2iz5lg9b3gb0jPJ0QWoNiG9lyMmy6f6xUx3NB1U0kEgtYdyYIOPF4Noqi
         FBbpqBGqnBqCtaCVV8KEbNUg/HJM4IbKCq87GiP9e2HTSLYoxk5IEgipA7Qj8sgb9hkR
         kpjWoz1RmsaLh+iixT2GSTsm5jS3TtAwd5quwDNWMfFsV1paIcu5/P2c08OHDL1qQiki
         DX5Yhy8zGmiKw41yfoYc4G4MFgEhhegEIuXXkk72lAJskKstP4sLljUDhlvzX7WKZAFz
         wILQYYiQeLiUxZUXW+f2wrpb2BgclEHyQo6mxTn9qLnpwF8YlJuq33M+Uv94sfyW01vl
         hc8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789403574; x=1790008374; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U2puunLcCA0Ud8zKAQs4npBTHlIwjTI7Amm7eOrF5FM=;
        b=YSs312yOA3cfDwuNEq7ldFs7J/bzhZb5Eg6CpkI8mTMatFKrdPY3TOxKJeEzAb2JGQ
         h/0PR4+TAp4VD3EYj4c+FR9T1tZs5XKtEwpBkk6lR5UpZEOzDdyUhHpKI7YaayFIBDQB
         UQFv+IOkOj2QomzO3FaYYCECimXJWcmICSqNrIEDeFdXlHmbyuFbuelAYGn8JWI+JnJP
         GaKACn4xTvoY7Wvb2ocUiDQ7rilf1MuJbv8VQBDLy6RUUH3GbSTCbGnfo/CgL8BnUrh8
         U6Hjfi2FKxvkffZZ7XqRSo6R8u940gY+JtsFVi4dHrmFDaau0dLpRcwQb7fKCGKhN+Ni
         vi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789403574; x=1790008374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2puunLcCA0Ud8zKAQs4npBTHlIwjTI7Amm7eOrF5FM=;
        b=Wj0S7X3iKtSTThyv2Z+dAAT+PzXQUER2jydGiSoG/9wPnho70DxWninoB1AhS1obpe
         vseOHUI9MPj8BaCivJG/BoHyBPahZ7i/3iKMIKPlktBEQRk7GJT7Cm81vwPl96GzyRin
         umn+PHSzNNJmJy1HXPdKsB7pXUw/nediQdNmKpDR9VwO9zNSqMUzbw7MVdwZZV3H+KCI
         YMFjd3AIPylHVM2+6zrkufcr2eaPl2lsqhIncct3qxB6YBmcY3OtLLGdRto27xYeTBRs
         ayDnANlHQC+9VUdeU7T9hMkhx5rNU4v58tEKQ4bgYVmctIw2+uSGDG+QK8tofG5zHvFO
         F8Bw==
X-Forwarded-Encrypted: i=1; AKwUvByZwnJ0SEsbA1u10QZyHZ4N5RgOHfWYS1p3ytiaPU+cWLQFef61adncMIhA66F5q8R72OMwYrWRY+9sRA==@lists.infradead.org
X-Gm-Message-State: AFuF++lzWLDrt1kzpRyw961O60RwIR1qqZiALoinJWnbfWO8GxGKorXN
	hkp+UqFoELfSYmugjmf+pT8dXDoqG0eaSsVCz4jjiweiBMCTV3ahWoyqAqbIBNVv6aInUEIWI42
	Fyz9+DsRNxZdXQ34XwrhhlWTvd+fYRV0sihRoULsHXw==
X-Gm-Gg: AYBFou3xqVrpyOcSUHT9Igfxj54s16iZM93L8v1JvO8eoq22cttuWq8eDjKehhbrK2S
	oW9dMbd4uH+pL1ajE7rCqA12WX89x22C8W0nTzqzcFpJ2ZLzZUGbDUnuaDOwZvv2teQdPZDYdgf
	VxPYJwI/ghz36kHGuRh/QVB79gIHVtL+SWK3Z3eG0y6WKUCHU9Oj1BIZxZFm5CFVJdmwTiGPFT9
	sC+v+ABtKLjFnL1w4SvQOMA1StACrgeCSl9VDFUPNeiUTJB+opzOmf6/S3aJJ0oSdw1/Kvh5yKR
	URDUxj4QhGMkjcDNA68l8vbZIvUXGc6nAQCaQw7Q8CZCQZXJmfKXBWmAfhWgDMm5hiJxZBvsXEw
	DFuS6dfQp6p/BDIpMGGcE5ypyrAtPEW9o/JD18T6WO80X
X-Received: by 2002:a05:690c:d8c:b0:862:ec8:d142 with SMTP id
 00721157ae682-88d1f505069mr12332497b3.15.1789403574227; Mon, 14 Sep 2026
 09:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
In-Reply-To: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 14 Sep 2026 11:32:41 -0500
X-Gm-Features: AcwNN1VyLPHubK4HBe4wLXnzYSfxOmAhK5WWmFPob51Sa4JHSy9JegsQyxuk3OE
Message-ID: <CAEev2e-zQotX9=QCfZxvYHpUD-hSgxbEjsVey4hEc2YbpoRjnA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add UFS Host driver support for SpacemiT K3 SoC
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_093256_327679_303FC590 
X-CRM114-Status: GOOD (  20.64  )
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

SGkgWWl4dW4sCgpPbiBUdWUsIFNlcCA4LCAyMDI2IGF0IDI6NDLigK9BTSBZaXh1biBMYW4gPGRs
YW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyB0cnkgdG8gYWRkIFVGUyBzdXBw
b3J0IGZvciBTcGFjZW1pVCBLMyBTb0MsIHRoZSBjb250cm9sbGVyCj4gY29tcG9uZW50cyBjb25z
aXN0cyBvZiBTeXN0ZW0gQnVzIEludGVyZmFjZSBVbml0LCBVRlMgSG9zdCBDb250cm9sbGVyCj4g
SW50ZXJmYWNlLCBVRlMgVHJhbnNwb3J0IFByb3RvY29sIExheWVyLCBVRlMgSG9zdCBSZWdpc3Rl
cnMsIERldmljZQo+IE1hbmFnZW1lbnQgRW50aXR5IChETUUpLCBUcmFuc3BvcnQgTGF5ZXIsIE5l
dHdvcmsgTGF5ZXIsIERhdGEgTGluawo+IExheWVyLCBQSFkgQWRhcHRlciBMYXllciwgYW5kIE0t
UEhZIEludGVyZmFjZS4gQSBtb3JlIGRldGFpbCBmdW5jdGlvbmFsCj4gYmxvY2sgZGlhZ3JhbSBj
YW4gYmUgZm91bmQgaW4gU3BhY2VtaVQgd2Vic2l0ZSwgY2hhcHRlciA5LjcuMyBbMV0KPgo+IE9u
ZSBrbm93biBpc3N1ZSBpcyB0aGF0IHRoZSBkZXZpY2Ugd2lsbCBvY2Nhc2lvbmFsbHkgcmFpc2Ug
QktPUFMgaW50ZXJydXB0Cj4gd2hlbiBkb2luZyBzb21lIGhpZ2ggbG9hZCB0ZXN0LCBsb2cgZnJv
bSBkbWVzZyBzaG93cwo+Cj4gWyAgODA2LjcxMDc2M10gdWZzaGNkLXNwYWNlbWl0IGMwZTAwMDAw
LnVmc2hjOiB1ZnNoY2RfYmtvcHNfZXhjZXB0aW9uX2V2ZW50X2hhbmRsZXI6IGRldmljZSByYWlz
ZWQgdXJnZW50IEJLT1BTIGV4Y2VwdGlvbiBmb3IgYmtvcHMgc3RhdHVzIDEKPgo+IExpbms6IGh0
dHBzOi8vc3BhY2VtaXQuY29tL2NvbW11bml0eS9kb2N1bWVudC9pbmZvP25vZGVwYXRoPWhhcmR3
YXJlL2tleV9zdG9uZS9rMy9rM19kb2NzL2szX3VzZXJtYW51YWwvMDlfbWVtb3J5X3N0b3JhZ2Uu
bWQmbGFuZz1lbiBbMV0KPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5Aa2VybmVsLm9y
Zz4KPiAtLS0KPiBDaGFuZ2VzIGluIHY0Ogo+IC0gZml4IGNsb2NrIGFuZCByZXNldCBzZXR0aW5n
cwo+IC0gZHJvcCBmdW5jdGlvbiB3aGljaCByZXRyaWV2ZSB2YWx1ZSBvZiB0eF9sYW5lcwo+IC0g
cHJvcGFnYXRlIHJldHVybiBlcnJvciBvZiB1ZnNfc3BhY2VtaXRfZG1lX3NldCgpCj4gLSBjaGVj
ayByZXR1cm4gdmFsdWUgdWZzX3NwYWNlbWl0X2NoZWNrX2hpYmVybjgoKQo+IC0gZHJvcCBjYWxs
IHRvIHVmc2hjZF92b3BzX3BoeV9pbml0aWFsaXphdGlvbigpCj4gLSBoYW5kbGUgY29tcGlsaW5n
IHdhcm5pbmcgaWYgQ09ORklHX09GIG5vdCBlbmFibGVkCj4gIGFkZCBfX21heWJlX3VudXNlZCB0
byB1ZnNfc3BhY2VtaXRfb2ZfbWF0Y2gKPiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vcGF0Y2gubXNn
aWQubGluay8yMDI2MDgwNi0wOC1rMy11ZnMtc3VwcG9ydC12My0wLTAzN2ZiMzIyYWNkYkBrZXJu
ZWwub3JnCj4KPiBDaGFuZ2VzIGluIHYzOgo+IC0gY29sbGVjdCB0YWdzCj4gLSBmaXggZHQtYmlu
ZGluZyB3YXJuaW5nIHJlcG9ydGVkLWJ5IHNhc2hpa28KPiAtIGZpeCBsb3cgZnJlcSBpbiBvcHAt
MiB0YWJsZQo+IC0gZml4IGVyciBjaGVja2luZyBpbiBjaGVja19oaWJlcm44KCkKPiAtIHByb3Bh
Z2F0ZSBlcnIgY29kZSBpbiBsaW5rX3N0YXJ0dXBfbm90aWZ5KCkKPiAtIHVwZGF0ZSBkb2N1bWVu
dHMgZm9yIGV2ZW50X25vdGlmeSgpCj4gLSB1ZnMgY2xvY2sgZHJpdmVyIGlzIG1lcmdlZCBpbnRv
IHY3LjMtcmMxLCB1cGRhdGUgY292ZXIgbGV0dGVyCj4gLSBMaW5rIHRvIHYyOiBodHRwczovL3Bh
dGNoLm1zZ2lkLmxpbmsvMjAyNjA3MjUtMDgtazMtdWZzLXN1cHBvcnQtdjItMC00NTAzNmEyYTI0
MThAa2VybmVsLm9yZwo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIGZpeCBtaXNzaW5nIGludGVycnVw
dHMgcHJvcGVydHkKPiAtIG1vdmUgdWZzIG5vZGUgdG8gazMtY29tMjYwLmR0c2kKPiAtIGNvbnZl
cnQgZnJlcS10YWJsZS1oeiB0byBvcGVyYXRpbmctcG9pbnRzLXYyCj4gLSByZXdvcmsgcmVzZXRf
Y29udHJvbCwgZml4IGhlYWRlciBhbmQgZHJvcCBnbG9iYWwgdmFyaWFibGUKPiAtIGRyb3AgZHVt
cF9ob3N0X3JlZ3MoKSBkZWJ1ZyBpbnRlcmZhY2UKPiAtIGNvbnZlcmdlIGFuZCByZWZhY3RvciBk
bWVfc2V0KCkgb3BlcmF0aW9ucwo+IC0gbWFzc2l2ZSByZWR1Y2Ugb2YgYnVzeSBkZWxheSgpIGxv
b3BzCj4gLSBkcm9wIHZlbmRvciBzcGVjaWZpYyBoY2VfZW5hYmxlX25vdGlmeSgpLCBmYWxsYmFj
ayB0byBkZWZhdWx0Cj4gLSBkcm9wIHVudXNlZCBtZW1iZXIgZnJvbSBzdHJ1Y3QgdWZzX3NwYWNl
bWl0X2hvc3QKPiAtIGFkZCBDT01QSUxFX1RFU1Qgc3VwcG9ydCB0byBLY29uZmlnCj4gLSBjb21t
ZW50IHN0eWxlIGZpeAo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIw
MjYwNzAyLTA4LWszLXVmcy1zdXBwb3J0LXYxLTAtMWE2NGEzYWIxMjhmQGtlcm5lbC5vcmcKPgo+
IC0tLQo+IFlpeHVuIExhbiAoMyk6Cj4gICAgICAgc2NzaTogdWZzOiBzcGFjZW1pdDogZHQtYmlu
ZGluZ3M6IEFkZCBVRlMgY29udHJvbGxlciBmb3IgSzMgU29DCj4gICAgICAgc2NzaTogdWZzOiBz
cGFjZW1pdDogazM6IEFkZCBVRlMgSG9zdCBDb250cm9sbGVyIGRyaXZlcgo+ICAgICAgIHJpc2N2
OiBkdHM6IHNwYWNlbWl0OiBrMzogQWRkIFVGUyBzdXBwb3J0Cj4KPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvdWZzL3NwYWNlbWl0LGszLXVmc2hjLnlhbWwgfCAgNTYgKysKPiAgYXJjaC9yaXNj
di9ib290L2R0cy9zcGFjZW1pdC9rMy1jb20yNjAuZHRzaSAgICAgICAgfCAgIDQgKwo+ICBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLXBpY28taXR4LmR0cyAgICAgICB8ICAgNCArCj4g
IGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaSAgICAgICAgICAgICAgIHwgIDIy
ICsKPiAgZHJpdmVycy91ZnMvaG9zdC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMTIgKwo+ICBkcml2ZXJzL3Vmcy9ob3N0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCj4gIGRyaXZlcnMvdWZzL2hvc3QvdWZzLXNwYWNlbWl0LmMgICAgICAgICAg
ICAgICAgICAgIHwgNjc4ICsrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL3Vmcy9ob3N0
L3Vmcy1zcGFjZW1pdC5oICAgICAgICAgICAgICAgICAgICB8ICA3OSArKysKPiAgOCBmaWxlcyBj
aGFuZ2VkLCA4NTYgaW5zZXJ0aW9ucygrKQoKVGVzdGVkLWJ5OiBBbmlydWRoIFNyaW5pdmFzYW4g
PGFzcmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
