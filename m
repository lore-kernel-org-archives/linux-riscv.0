Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7381C4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jv1Ia/gcdBHlvMAxHuuIUc4lU/0i2JyGctHQQcoLkqo=; b=Sf3MHfzTa3GbgH
	yK26RQDFEdGw3It5jy34KItkOV4gd0Ai6RrP5yYZ1nsQbnILeAsHsjyS0PD8D83qFvw2ejSscy+FN
	ZriiBrW9bb3Gt+d0PVGk05P+NvmeZGmV0VisI4igr82BLM+TJnR27MgBNvBfeu3OEDg6QgCBSgDd1
	g37DYgRJBMAefxn0fpjvyjgE1R3nToMPN5J/W9m68xmmoCdHNJ+lEytHRBzMZ9YsMBCv7K00ngatw
	dy7KqmYHPqxNGCMiLkfZy9sVboOnhCtkb+8ZUKXL6yUR0FpwcrcLMWGJH8m6fpmVTx50zjtcZvuHt
	PEQAbWUoeqKNh2y5rv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Q8-000000094FG-0VN5;
	Tue, 21 Jul 2026 10:09:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Q5-000000094Ck-0ekQ
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 10:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784628586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/LcZsIYEi/WvQwQWFUmWBxrZuJIg8BbyzJ3Kz0eMgA=;
	b=Yk+6BI7qrhAg/Erm7kuhBH/dgmWIKbrlPSBdSTk0J1FR0iZ0UXypUMdh/awvHvEFN4n1mN
	Yatl8lavNj2mDLYpsV6O1IBeK1vd381GftMlL0Bs8mQ93L+rrhUum7j61bDbId1e7u2Vpg
	j3z33kapuBvNMaQ9tIrKtsW1biDXApc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-CY7Nx89hNkaFu7KsoGhx6g-1; Tue, 21 Jul 2026 06:09:45 -0400
X-MC-Unique: CY7Nx89hNkaFu7KsoGhx6g-1
X-Mimecast-MFC-AGG-ID: CY7Nx89hNkaFu7KsoGhx6g_1784628584
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so2621865e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 03:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628584; x=1785233384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/LcZsIYEi/WvQwQWFUmWBxrZuJIg8BbyzJ3Kz0eMgA=;
        b=mpIK1xQL40SoXERgXYaahtZMi/KND9aSp27j8Z1M+MdGEVAfiJjmCBXnT/kynt+87l
         x+joCOtfIRH2KVpPGDctBg14rdvosrxg3kMdZWH/2Q0tBO+qAUWdJSaLROtcAGO/RTI6
         iDZmArzue9hOJjSC0tSbb7uEUQwqk2T6Gsv8J0TBrileD9yQN1VGxBRWdc/uyXxNzsmd
         DfqkO1MDfaktY5aKM5l2VTyHOQzvT2yi4crVIQTJirNxWSbQE8yF/x72ZM5d66yIYkAT
         ps1virWsbfLFnoqcuNuqOd7L8VD50NTNaj5JO2j3P/ZN8snspjs7jPPv5ktCWA848fSB
         z7Fw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/PBaOUPL4gW0yfhMlfbIrmndboqFGHBd7SiVyJaltMAeslN/UsE5ixCGhCKsOGW7S67vtWOVKeSLGyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzY5BgufL7OFSNZxZjbaE7HIMLtBpR3m5qmkhzAyLZ/TmHxsswn
	WNvam/8B4bSwhygpzb4FLQMfQDIc54IU+kY2SP+Oc85il6RfdVu6LKfCVI+uvrYPIp1kzPtgbFC
	i6h+bzmrQhcc1LAe2zWHQYKl9uiIpmmrm3N8oNxSpkkBIRwkyt+ZOqaEiJLI/t+OaYjzneXqZtz
	rn5PC9NggdIhmK6hGGIvn0KwDT+X5qbgvP0y8HP/epeE05
X-Gm-Gg: AfdE7cnsJ52FyGGn3qfeQi4FbueMTuL1azMoT/oOKInalMPt6qlKiWozgL2oWnP+3DY
	dbX4EPqYiZzmwyEIG/gVpSC+zguL2g/KEnwtRbNYQmf/pn7EE3NVUY32B2DAyQ6PZEEM7SIW4Ic
	2IHFFqP0GV4mpcCk6ncIuZQsCJRrPuIhnYE968hpFqJnGIv54gadM3nA7cdObdC753Q9qJCLvcP
	WAr/pXSqzyIQVN5rpTxbIDcqswg32mxf3+Ika1FnxKvTt86G+9mlrty/5qi
X-Received: by 2002:a05:600c:4ed0:b0:493:c634:952 with SMTP id 5b1f17b1804b1-4954a3d0872mr196477825e9.7.1784628583582;
        Tue, 21 Jul 2026 03:09:43 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed0:b0:493:c634:952 with SMTP id
 5b1f17b1804b1-4954a3d0872mr196477225e9.7.1784628582637; Tue, 21 Jul 2026
 03:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2iT3GmYz+n_jzbQ4V_5P7UdfFhmq=BSOgYCDEQ6PPuZA@mail.gmail.com>
In-Reply-To: <CAAhSdy2iT3GmYz+n_jzbQ4V_5P7UdfFhmq=BSOgYCDEQ6PPuZA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Jul 2026 12:09:29 +0200
X-Gm-Features: AUfX_mzqp4co9SVxJ6Oxz0wZJjADoZUw52gPjsL2VGGBD-drbZ_ihcWCOMvdB5w
Message-ID: <CABgObfb5KVNVBj9bDbcW5Y0WFYvC0A33-GBoy_UKuWUMPCBQhQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 7.2 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PLgUNc75QO7H-UE2lt6AkXP9Bl4osF5SPr9EA2JUxr8_1784628584
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_030949_265374_71F3E2AE 
X-CRM114-Status: GOOD (  13.29  )
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

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTA6MDPigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSB0aGUgZm9sbG93aW5n
IGZpeGVzIGZvciB0aGUgNy4yIGtlcm5lbDoKPiAxKSBBdm9pZCByZWR1bmRhbnQgcGFnZS10YWJs
ZSBhbGxvY2F0aW9ucyBpbiBpb3JlbWFwIHBjYWNoZSB0b3B1cAo+IDIpIEFwcGx5IFNCSSBGV0ZU
IExPQ0sgZmxhZyBvbmx5IG9uIHN1Y2Nlc3NmdWwgc2V0Cj4gMykgQm91bmQgU0JJIFBNVSBjb3Vu
dGVyIG1hc2sgc2NhbiB0byBCSVRTX1BFUl9MT05HCj4gNCkgU2tpcCBUTEIgZmx1c2ggd2hlbiBH
LXN0YWdlIFBURSBiZWNvbWVzIHZhbGlkIHdpdGggU3Z2cHRjCj4gNSkgWmljYm9bbXx6fHBdIGJs
b2NrIHNpemVzIHNob3VsZCBiZSBhbHdheXMgcHJlc2VudCBpbiBPTkVfUkVHCj4gNikgSW5qZWN0
IGluc3RydWN0aW9uIGFjY2VzcyBmYXVsdCBvbiB1bm1hcHBlZCBndWVzdCBmZXRjaAo+IDcpIFNl
cmlhbGl6ZSB2aXJ0dWFsIGludGVycnVwdCBwZW5kaW5nIHN0YXRlIHVwZGF0ZXMgdXNpbmcgYSBy
YXcgc3BpbmxvY2sKPiA4KSBGaXggU3BlY3RyZS12MSBpbiB2ZWN0b3IgcmVnaXN0ZXIgYWNjZXNz
IHZpYSBPTkVfUkVHCgpQdWxsZWQsIHRoYW5rcy4KClBhb2xvCgo+Cj4gUGxlYXNlIHB1bGwuCj4K
PiBSZWdhcmRzLAo+IEFudXAKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQg
YTEzYzE0MGNjMjg5YzBiN2IzNzcwYmNlNWIzYWQ0MmFiMzUwNzRhYToKPgo+ICAgTGludXggNy4y
LXJjMyAoMjAyNi0wNy0xMiAxNDoxNjozOSAtMDcwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xp
bnV4LmdpdCB0YWdzL2t2bS1yaXNjdi1maXhlcy03LjItMQo+Cj4gZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDhkOWM5YjEzNWI1YzIzZGU5ODExYTg0MjYyNTdjYmQyZmEwMjRhOTk6Cj4K
PiAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYxIGluIHZlY3RvciByZWdpc3RlciBhY2Nlc3Mg
KDIwMjYtMDctMTUKPiAxODowNjoxNiArMDUzMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3YgZml4
ZXMgZm9yIDcuMiwgdGFrZSAjMQo+Cj4gLSBBdm9pZCByZWR1bmRhbnQgcGFnZS10YWJsZSBhbGxv
Y2F0aW9ucyBpbiBpb3JlbWFwIHBjYWNoZSB0b3B1cAo+IC0gQXBwbHkgU0JJIEZXRlQgTE9DSyBm
bGFnIG9ubHkgb24gc3VjY2Vzc2Z1bCBzZXQKPiAtIEJvdW5kIFNCSSBQTVUgY291bnRlciBtYXNr
IHNjYW4gdG8gQklUU19QRVJfTE9ORwo+IC0gU2tpcCBUTEIgZmx1c2ggd2hlbiBHLXN0YWdlIFBU
RSBiZWNvbWVzIHZhbGlkIHdpdGggU3Z2cHRjCj4gLSBaaWNib1ttfHp8cF0gYmxvY2sgc2l6ZXMg
c2hvdWxkIGJlIGFsd2F5cyBwcmVzZW50IGluIE9ORV9SRUcKPiAtIEluamVjdCBpbnN0cnVjdGlv
biBhY2Nlc3MgZmF1bHQgb24gdW5tYXBwZWQgZ3Vlc3QgZmV0Y2gKPiAtIFNlcmlhbGl6ZSB2aXJ0
dWFsIGludGVycnVwdCBwZW5kaW5nIHN0YXRlIHVwZGF0ZXMgdXNpbmcgcmF3IHNwaW5sb2NrCj4g
LSBGaXggU3BlY3RyZS12MSBpbiB2ZWN0b3IgcmVnaXN0ZXIgYWNjZXNzIHZpYSBPTkVfUkVHCj4K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gQW51cCBQYXRlbCAoMSk6Cj4gICAgICAgUklTQy1WOiBLVk06IFppY2JvW218
enxwXSBibG9jayBzaXplcyBzaG91bGQgYmUgYWx3YXlzIHByZXNlbnQgaW4gT05FX1JFRwo+Cj4g
RHlsYW4uV3UgKDEpOgo+ICAgICAgIHJpc2N2OiBrdm06IFNraXAgVExCIGZsdXNoIHdoZW4gRy1z
dGFnZSBQVEUgYmVjb21lcyB2YWxpZCB3aXRoIFN2dnB0Ywo+Cj4gRmFuZ3l1IFl1ICgxKToKPiAg
ICAgICBSSVNDLVY6IEtWTTogQXZvaWQgcmVkdW5kYW50IHBhZ2UtdGFibGUgYWxsb2NhdGlvbnMg
aW4gaW9yZW1hcCB0b3B1cAo+Cj4gUWluZ3dlaSBIdSAoMSk6Cj4gICAgICAgUklTQy1WOiBLVk06
IEluamVjdCBpbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQgb24gdW5tYXBwZWQgZ3Vlc3QgZmV0Y2gK
Pgo+IFNldW5nSnUgQ2hlb24gKDEpOgo+ICAgICAgIEtWTTogcmlzY3Y6IFNCSSBGV0ZUOiBBcHBs
eSBMT0NLIGZsYWcgb25seSBvbiBzdWNjZXNzZnVsIHNldAo+Cj4gU2hlbmd3ZW4gQ2hlbmcgKDEp
Ogo+ICAgICAgIEtWTTogcmlzY3Y6IFBNVTogQm91bmQgY291bnRlciBtYXNrIHNjYW4gdG8gQklU
U19QRVJfTE9ORwo+Cj4gWGllIEJvICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogU2VyaWFsaXpl
IHZpcnR1YWwgaW50ZXJydXB0IHBlbmRpbmcgc3RhdGUgdXBkYXRlcwo+Cj4gWm9uZ21pbiBaaG91
ICgxKToKPiAgICAgICBLVk06IHJpc2N2OiBGaXggU3BlY3RyZS12MSBpbiB2ZWN0b3IgcmVnaXN0
ZXIgYWNjZXNzCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMTAgKysr
LS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICB8IDM1ICsrKysrKysrKysr
KysrKystLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jICAgICAgICAgICB8ICA2ICsrKy0K
PiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAgICAgICAgICAgIHwgIDMgKy0KPiAgYXJjaC9yaXNj
di9rdm0vdmNwdS5jICAgICAgICAgICAgIHwgNjggKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jICAgICAgICB8IDE5ICsr
KysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDQ2ICsrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAgICAg
ICB8ICA0ICstLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgICAgfCAgNiArKy0t
Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgICAgICB8IDE0ICsrKysrKy0tCj4gIDEw
IGZpbGVzIGNoYW5nZWQsIDEzNyBpbnNlcnRpb25zKCspLCA3NCBkZWxldGlvbnMoLSkKPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
