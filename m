Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD56CD37AC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 04:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n35zd3ZcXtAVvkT5sVzwRxeLXgXLDgxa8kwLFCDn9jg=; b=Bp9X395fLqzO/aaXJTwnvf5TO2
	wPxLrLjVnSD8KgtG87JsQVy+DZ3TZlTCfl0/2NahswY1di6cSCw7IK8lNcf94FSz7EISiWgnIgeyx
	Wxw9wMujE8/6oek4LMVbe0wFUcOXgeCIMVCVOdMLsOOfIZE20hHp6wElUUIRCAp4Q9E8gaeIrlUuK
	UBknCBL7PAq7g545ymAN3ue9S47bciVJQpHCeF1GeLrBLbmnRdXtz3HFR0RXKk3vDBtrylenCCisi
	Xzq1Wqb6Abf0esYsBGJSz27AQa3LhLYCemSiuM4gB9hYJ3XvbESS0sfJHeKQKjpBz1s1RZbmqxS5F
	2Kz5zQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOTEa-0000000C5Vk-379G;
	Sun, 17 May 2026 04:36:12 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOTEY-0000000C5Uv-0gHu
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 04:36:11 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so2134294a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 21:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778992568; cv=none;
        d=google.com; s=arc-20240605;
        b=Do5UjA7vI6DTqwVBVj1h4foHsQX6uL0GzlrQ/Wa2ULIGGyPaqs2Yf1w7HcLBTOKkeI
         qdEA3PpkK3P/RySqACPqXqJZFOprEe+U8bpjCjxyRmLdJqsok93m8EDPD9M3bhepvVEj
         /IUiXw0p1g9IBPM1hAc6MWbWx1Vb01TSpsIaBz5MWg/uzeqR5RLRdEbCdyDp/qrFqzcf
         oJSj+0eSMzNerdL08PTf7KpAWALEdai6UL+B17TG1M2k/28mt73W4mhFLwTYKTVNCQjP
         AQknxQmWFNKA/7RC6ZS5tgRpFbmSV7cXQqtsRznJhVhPtZ3X708XMT63MWiBQkH95Qn7
         JQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JQM4qBv1wE3brKr2hKxWej6MOZp+Tj3Sd6cgQ9f4fd8=;
        fh=eUffoHabHj7EcAeWNA7XhCJoWgHdK/tnWoBhzxscXRg=;
        b=d3m+dw7pUA/IpJpV2UeQbGYEhUyR4rv7mMEkR3eemrolXuCuq3zi1z/ixI2ZeMRwRa
         9SsOmPG1oR5DAtu04sPnoMHJuV6pzerdGGCrpfezeSAI3AN2H9bJU6FT/pWRKvT/mq9N
         RjbvpJE/v6JOT2AwcM7NxeOVjAVM+HodJ8eiv5fDzRWIn7e+j8ujbi8sZ1I9P2xWdgKq
         oIvq1LyjhaVXPOJtgNIV6upTxi0wB0grhfDSle/w0APMHeXG8JEmhs5/5OLYLlnlA/Pl
         +lXp8o5kAwDaalP8CDEZudD4suIsTEL/tnUmptFDWJK2lwmLjpJQdgRKmn2hZwlMFB2T
         v19A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778992568; x=1779597368; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQM4qBv1wE3brKr2hKxWej6MOZp+Tj3Sd6cgQ9f4fd8=;
        b=gNREG/iODjJGESDHY1JEcQ/MIZdO6sSpX6VxyXUcHZ1r40D2SlK98qxLBsKjtBNfbb
         1LA+QVBWcyTZGZtoL+4OpaRsxqJ/iTDW793J/PdtzVWCtLRp8HX6cWgVKTqHWhkHpYpM
         /1+2ABZhBHs+vmPrUVV7uI5UAiUWzm4y31iKxBCbqWHfBUVc+gRUDlsU79gfc522VlDP
         oHsI5zyvjCyihpfIyBkNpRSuvfgOOgKg50lk1zuAvASSl8J+Res8uohmzGmQ0yParxke
         Gm7pjtbgLIbGfc6tYlWDX0C7z6pXQqHdmxrs4jDaL+NVrOf5drO8kLnRiy3OpWd4T5Np
         MzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778992568; x=1779597368;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQM4qBv1wE3brKr2hKxWej6MOZp+Tj3Sd6cgQ9f4fd8=;
        b=cCFpYvCUAwQxrWkpWsq5PLFulLlI+mGIqkYCODk4zHSPfE7XvwdAXvrwC5i5TmZrN2
         t6z13tfuk04mW6s7y1K4uyiPWqRG+ibIf6E4IqANJ0FvEcRQmvdZY+hORY8uG84itB5L
         QF0XSjdt9rtiAqr1wXXmCVCcnnhqhQH9F4Y54NRZNDSgbdpysLz+K0CtQNEctIOsbBYS
         sYXuGyUN39IiPAzWQQFgg/qGl0SBiQ4Ck9jOWX6jf0YSmaefHO6Oh3DW2MfC6/PzLfGd
         AStwVHW7c1zYFFziZduFruC/uj/2H/43n438KH+/aS0Ra+vhBN4jvVrDRcbRFZMC7Nzk
         kV3g==
X-Forwarded-Encrypted: i=1; AFNElJ/rV0lAvuOZoj6xe89bYnarrOlwdsRGGxscDHz1bED3YkpLLWQhfO19sLTMwFSd6MVtCkz4cwInRixAfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzE6m+oFEZ1kiDVmGoY9DOkMd9v2dF+kW0cCCKG5dsSY760z0b
	1ONrhgUfPQnQ1iEYzEdTEICcVUuQ7r3KFkgOWkQ6r4Ejs6kcEtGjpViBBW/s43kaIg8na05TBwS
	driq7LCk7cEAqMF5DcpXppz8i/Boj6QE=
X-Gm-Gg: Acq92OGhvhXvEyiFYGQJHE6jEPXN0AM9SK62eonOzoLScIHjkQhQ9GLkPcO4NwQ2XDM
	O3p2zBzW6b52CYP02FXSYcms5NFs7zBIROWrkOEmcNkxATxvP/CqrqgAxScvPhtVLfVUqwr+KVM
	MhL4bXHrjWnU5fPtzMA4Y3YfKhEDVAOx9VDbBkmsQq0uuINYGuegSac1kw4hDVOILxF31lqNgMe
	gbdNqOS5mrcQso/wRWkqMehID+u9xSCFzbRs+nbxDw0phF1gomWlFaL+6+y7VtHNAiOOmYmMpIs
	Ye0kLQ==
X-Received: by 2002:a05:6402:4541:b0:676:9c6d:5c59 with SMTP id
 4fb4d7f45d1cf-683bc4b0a51mr3550891a12.2.1778992567465; Sat, 16 May 2026
 21:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org> <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org> <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net> <DHYOIIFMGH7J.228ISQ7XYFGKE@mailbox.org>
 <aeevr6Zj3Pwm9wux@aurel32.net> <CANAwSgSCo-mESo6=KSc08oUzTWAgzpYu0JaW5KqmnCNiPYHjxQ@mail.gmail.com>
In-Reply-To: <CANAwSgSCo-mESo6=KSc08oUzTWAgzpYu0JaW5KqmnCNiPYHjxQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 17 May 2026 10:05:50 +0530
X-Gm-Features: AVHnY4KOL2rGt_SSoRHMzxpCQMBvp_fsFHr614JlPdf6906rsMFKS9vQD857v9s
Message-ID: <CANAwSgRFQiNEi1Ac+sCvJWkj1R+yEPGt0RCjZu-3ZiD0Ffm6Hg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, Anand Moon <linux.amoon@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_213610_232954_157302A2 
X-CRM114-Status: GOOD (  28.37  )
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

SGkgU2h1d2VpLAoKT24gV2VkLCAyMiBBcHIgMjAyNiBhdCAxMTo0NCwgQW5hbmQgTW9vbiA8bGlu
dXguYW1vb25AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIFNodXdlaSwKPgo+IE9uIFR1ZSwgMjEg
QXByIDIwMjYgYXQgMjI6NDEsIEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4g
d3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+ID4gT24gMjAyNi0wNC0yMSAxNjoxMCwgU2h1d2VpIFd1
IHdyb3RlOgo+ID4gPiBIaSBBdXJlbGllbiwKPiA+ID4KPiA+ID4gVGhhbmtzIGZvciB5b3VyIGFk
ZGl0aW9uLgo+ID4gPgo+ID4gPiBPbiBUdWUgQXByIDIxLCAyMDI2IGF0IDU6MTYgQU0gQ1NULCBB
dXJlbGllbiBKYXJubyB3cm90ZToKPiA+ID4gPiBIaSBBbmFuZCwKPiA+ID4gPgo+ID4gPiA+IE9u
IDIwMjYtMDQtMTYgMTc6MDcsIEFuYW5kIE1vb24gd3JvdGU6Cj4gPiA+ID4+IEFmdGVyIHJldmll
d2luZyB0aGUgQmFuYW5hIFBpIEYzIHNjaGVtYXRpY3MsIEkgY29uZmlybWVkIHRoYXQgQnVjazEg
YW5kIEJ1Y2syCj4gPiA+ID4+IEJvdGggc3VwcGx5IHRoZSBDT1JFXzBWOSB3aXRoIDAuOVbCsTEl
IHJhaWwuIFRvIHJlc29sdmUgdGhlIHJlc3RyaWN0aW9uIGVycm9ycywKPiA+ID4gPj4gSSBleHBh
bmRlZCB0aGUgdm9sdGFnZSByYW5nZSBpbiB0aGUgRFRTIHRvIDUwMCwwMDDigJM5NTAsMDAwIMK1
Vi4KPiA+ID4gPj4KPiBzb3JyeSBJIHdhcyB3cm9uZyBmcm9tIHRoZSBkb2MgYmVsb3cgMS4yLjEg
Q09SRSBQb3dlciBEZXNpZ24KPgo+IFRoZSB0eXBpY2FsIGNvcmUgdm9sdGFnZSBpcyAwLjkgViB0
byAxLjA1IFYuIEFjdHVhbCB2b2x0YWdlIGlzCj4gZHluYW1pY2FsbHkgcmVndWxhdGVkIGJ5Cj4g
dGhlICoqcmVtb3RlLXNlbnNlIGR5bmFtaWMgdm9sdGFnZSoqIGFkanVzdG1lbnQgY2lyY3VpdCBp
bnNpZGUgUDEuCj4gUDEgQlVDSzEgYW5kIEJVQ0syIG11c3QgYmUgY29tYmluZWQgdG8gc3VwcGx5
IHRoZSBjb3JlIHJhaWwuCj4KPiBbMV0gaHR0cHM6Ly93d3cuc3BhY2VtaXQuY29tL2NvbW11bml0
eS9kb2N1bWVudC9pbmZvP25vZGVwYXRoPWhhcmR3YXJlL2tleV9zdG9uZS9rMS9rMV9ody9rMV9o
d19kZXNpZ25fZ3VpZGUubWQmbGFuZz1lbgo+Cj4gPiA+ID4+IEFkZGl0aW9uYWxseSwgSSB1cGRh
dGVkIHRoZSBEVFMgdG8gbWFwIHRoZSBzZWNvbmQgQ1BVIGNsdXN0ZXIgKGNvcmVzIDTigJM3KQo+
ID4gPiA+PiB0byBCdWNrMiB0byBiZXR0ZXIgYWxpZ24gd2l0aCB0aGUgaGFyZHdhcmUncyBwb3dl
ciBkaXN0cmlidXRpb24uCj4gPiA+ID4KPiA+ID4gPiBBY3R1YWxseSB0aGUgb3V0cHV0IG9mIEJ1
Y2sxIGFuZCBCdWNrMiBhcmUgY29ubmVjdGVkIHRvZ2V0aGVyLCBzbyB0aGV5Cj4gPiA+ID4gc2hv
dWxkIGFsd2F5cyBiZSBjb25maWd1cmVkIHdpdGggdGhlIHNhbWUgb3V0cHV0IHZvbHRhZ2UuIEFu
ZCBib3RoCj4gPiA+ID4gY2x1c3RlcnMgc2hvdWxkIGJlIG1hcHBlZCB0byBib3RoIG91dHB1dHMu
Cj4gPiA+Cj4gPiA+IFlvdSBhcmUgcmlnaHQsIEkgcmVjZWl2ZWQgdGhlIHNhbWUgcmVzcG9uc2Ug
ZnJvbSB0aGUgb2ZmaWNpYWwgZGV2ZWxvcGVycy4KPiA+ID4KPiA+ID4gVGhlcmVmb3JlLCBJJ20g
d29uZGVyaW5nIGlmIGFuIGFkZGl0aW9uYWwgcmVndWxhdG9yLWNvdXBsZWQtd2l0aDogcHJvcGVy
dHkKPiA+ID4gZGVmaW5pdGlvbiBpcyBhbHNvIG5lZWRlZCBoZXJlPwo+ID4KPiBjb3JyZWN0Lgo+
ID4gWWVzLCBJIHRoaW5rIHRoaXMgaXMgdGhlIHdheSB0byBnby4gSSBldmVuIHdvbmRlciBpZiB0
aGlzIHNob3VsZG4ndCBiZSBhCj4gPiBmaXggd2l0aCBDYzogc3RhYmxlLiBUaGlzIGFsc28gaGFz
IHRvIGJlIGRvbmUgZm9yIHRoZSBNaWxrLVYgSnVwaXRlcgo+ID4gYm9hcmQsIEkgaGF2ZW4ndCBj
aGVja2VkIHRoZSBvdGhlciBib2FyZHMgeWV0LCBidXQgSSBndWVzcyB0aGV5IGFsbCB1c2UKPiA+
IHRoZSBzYW1lIHNjaGVtYXRpY3MgYXQgdGhhdCB0aGUgUE1JQyBsZXZlbC4KPiA+Cj4gPiBSZWdh
cmRzCj4gPiBBdXJlbGllbgo+ID4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyByZXNvbHZlIHRoZSB3
YXJuaW5nIG9uIG15IHNldHVwLgpJZiBwb3NzaWJsZSwgcGxlYXNlIGludGVncmF0ZSB0aGVtIGlu
dG8gdGhlIG5leHQgdmVyc2lvbi4KCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nw
YWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwpiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azEtYmFuYW5hcGktZjMuZHRzCmluZGV4IGMyYTFiNzU5ZDQxZi4uODUxMmM3NDE3Zjk0IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwor
KysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwpAQCAt
MTE2LDE5ICsxMTYsMTkgQEAgJmNwdV8zIHsKIH07CgogJmNwdV80IHsKLSAgICAgICBjcHUtc3Vw
cGx5ID0gPCZidWNrMV8zdjQ1PjsKKyAgICAgICBjcHUtc3VwcGx5ID0gPCZidWNrMl8zdjQ1PjsK
IH07CgogJmNwdV81IHsKLSAgICAgICBjcHUtc3VwcGx5ID0gPCZidWNrMV8zdjQ1PjsKKyAgICAg
ICBjcHUtc3VwcGx5ID0gPCZidWNrMl8zdjQ1PjsKIH07CgogJmNwdV82IHsKLSAgICAgICBjcHUt
c3VwcGx5ID0gPCZidWNrMV8zdjQ1PjsKKyAgICAgICBjcHUtc3VwcGx5ID0gPCZidWNrMl8zdjQ1
PjsKIH07CgogJmNwdV83IHsKLSAgICAgICBjcHUtc3VwcGx5ID0gPCZidWNrMV8zdjQ1PjsKKyAg
ICAgICBjcHUtc3VwcGx5ID0gPCZidWNrMl8zdjQ1PjsKIH07CgogJmVtbWMgewpAQCAtMjQ4LDE0
ICsyNDgsMTQgQEAgcG1pY0A0MSB7CiAgICAgICAgICAgICAgICByZWd1bGF0b3JzIHsKICAgICAg
ICAgICAgICAgICAgICAgICAgYnVjazFfM3Y0NTogYnVjazEgewogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDUwMDAwMD47Ci0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzQ1MDAw
MD47CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3Zv
bHQgPSA8OTUwMDAwPjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3It
cmFtcC1kZWxheSA9IDw1MDAwPjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1
bGF0b3ItYWx3YXlzLW9uOwogICAgICAgICAgICAgICAgICAgICAgICB9OwoKLSAgICAgICAgICAg
ICAgICAgICAgICAgYnVjazIgeworICAgICAgICAgICAgICAgICAgICAgICBidWNrMl8zdjQ1OiBi
dWNrMiB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNy
b3ZvbHQgPSA8NTAwMDAwPjsKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0
b3ItbWF4LW1pY3Jvdm9sdCA9IDwzNDUwMDAwPjsKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxMDUwMDAwPjsKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZWd1bGF0b3ItcmFtcC1kZWxheSA9IDw1MDAwPjsKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItYWx3YXlzLW9uOwogICAgICAgICAgICAg
ICAgICAgICAgICB9OwoKVGhuYWtzCi1BbmFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
