Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20035C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6A/poDYaMFO0TOqkKZnGV+1bb24DKAYKtcfTp4NKNE=; b=LBA3ms61GOlwqx
	15m2uS6qtNtAjBNkkPMKtJv9NweQcpjzVdMqDmGOudxy0rv7HJO0WB+nkDl3KZ6QAoQoPnnK0W5ei
	eBVrZP1B2J16XpJ0TtZjDIHTDM6IUEeeOjAajaOZJ8021I7meUQYxmPynEew5cAtyZIqEDCTd5RsK
	W26F6Z/Qa/hZ/yPtfY6GDV+1hyr4ugje9ZXUEsleQfTSJzicxktubcogVNWP5ehIbiaifLqu88PSv
	g530ggW1P3B/SKOqP1aeN3lcdaAi/i1y87kNveZob0bht2FHDMGXUxt0BB9X6Tz+rHojKDdBzgGlO
	egN3XuBLifYuYSvrZcLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Auc-00GipJ-0Z;
	Thu, 25 May 2023 13:21:50 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2AuZ-00Gio1-2P
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 13:21:49 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-ba8afcc82c0so1050622276.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 May 2023 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685020901; x=1687612901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2D6sf7OotstMG4fjL+LV8Xk0WYtEN7o8mVPfPP4hJc=;
        b=hjqXKLhsQ2aq9s0bxkpaEilM4R4O7PNM4z2rgkDCnMzWO50ta5q5Y6U0TdXrtF7+tl
         cBP3IcNtXNwXr8e9hYAp/1n9kRP9nLJB/8Dn+EEhizlruwuM9TaiZutTdq8dwEQk5CHB
         xH6w+5Dbc6AQZYnm1olOeJClidzVD1SVemwIif+TYkYY/iBuMccIeB5pkosIbGp6WOCq
         AQw22hHldiYRBoU56tplWIWm/PHNF2dltPOsHRydbBob25Z2zKQW+0rg89PLfUJI8eBa
         ahFEvGk5jMvQrcPk8DkeJuk7d+eLUuJmCbRJVCn4MFxYHmwSjeFtz0i+8MBgs1whNg4F
         UIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685020901; x=1687612901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2D6sf7OotstMG4fjL+LV8Xk0WYtEN7o8mVPfPP4hJc=;
        b=dSv1IFP3+k4HSlBZkBi/+f9pc13XPvfF1YyGhqr/vMrmnID8ixNhiIMtHREWdpZEr0
         WXUhek+6Ubx82/XWLZL2SXGXubtkuBy8xu1Cyy16Q63ca3e+Wa9Dw6auc04TxdY+QnPG
         7WSdDrg/HkkiMpZeJWJoNhAYpxX5s/Se4s0Kcg6egqLtgpMIHIeUzHB8bN2bs6+nIdUB
         XxjiFQZPSfKweUdmQuyGeqMCARe8QEotIXnvcXCJJF/zU1onK8R16ohRwUDpap6PXfjf
         1eXeIaSas0466J9WTLmPXrFbZMqp/h8w36Iv2tDF8ImEf6nUkp95GIR6zqEEM0cbh0ST
         6fsQ==
X-Gm-Message-State: AC+VfDx2ii/+ADGIh3OGwBtgCSLV++vdMfgx0qHHkA2FLPKgKyvJzvKd
	yy/UBL45v4x3waUErDHoWcJLDJBQN6gbZpdOA92OIKpPaYxVn9wRIBs=
X-Google-Smtp-Source: ACHHUZ4lsfr2X4npu8zvxcB/JBRGWlr11Ehk1blVXVkGhckzqImQwivBzeO8zGDwiY45pIe0KvbVPWCtSkWKaeWexNg=
X-Received: by 2002:a0d:fe83:0:b0:565:97ee:dd78 with SMTP id
 o125-20020a0dfe83000000b0056597eedd78mr685081ywf.28.1685020900657; Thu, 25
 May 2023 06:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
 <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
 <20230517-preacher-primer-f41020b3376a@wendy> <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
 <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <fe8d716c-fb4f-1f3f-6c69-de1d8b9fb6af@ghiti.fr> <CAK9=C2X1BjZCHfYM33pZQtavu7yRqxwsypWL5OWj79bJrnDMQg@mail.gmail.com>
 <CAOnJCULpa-TJuG=TtCDOxOdUviZzWheLE-GMiU1r7GWaKn0nuQ@mail.gmail.com> <20230525-guacamole-swimmer-68048a73baac@wendy>
In-Reply-To: <20230525-guacamole-swimmer-68048a73baac@wendy>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 May 2023 18:51:28 +0530
Message-ID: <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Atish Patra <atishp@atishpatra.org>, Alexandre Ghiti <alex@ghiti.fr>, robh@kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, jeeheng.sia@starfivetech.com, 
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, palmer@rivosinc.com, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_062147_793519_8C98CF3B 
X-CRM114-Status: GOOD (  47.39  )
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

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgNjozOeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMjQsIDIwMjMgYXQgMDQ6
NDU6MzZQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gPiBPbiBUaHUsIE1heSAxOCwgMjAy
MyBhdCA3OjA04oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3Rl
Ogo+ID4gPiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCA1OjM54oCvUE0gQWxleGFuZHJlIEdoaXRp
IDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPiA+ID4gPiBPbiA1LzE4LzIzIDA4OjUzLCBBbnVwIFBh
dGVsIHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgODoyNuKAr1BNIEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPj4g
T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMToyOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gPiA+ID4gPiBJIHRoaW5rIHdlIGhhdmUgdHdv
IHBvc3NpYmxlIGFwcHJvYWNoZXM6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gMSkgVXBkYXRlIE9wZW5T
QkkgdG8gc2V0ICJuby1tYXAiIERUIHByb3BlcnR5IGZvciBmaXJtd2FyZQo+ID4gPiA+ID4gICAg
ICByZXNlcnZlZCByZWdpb25zLiBXZSB3ZXJlIGRvaW5nIHRoaXMgcHJldmlvdXNseSBidXQgcmVt
b3ZlZAo+ID4gPiA+ID4gICAgICBpdCBsYXRlciBmb3IgcGVyZm9ybWFuY2UgcmVhc29ucyBtZW50
aW9uZWQgYnkgQWxleC4gSXQgaXMgYWxzbwo+ID4gPiA+ID4gICAgICB3b3J0aCBtZW50aW9uaW5n
IHRoYXQgQVJNIFRydXN0ZWQgRmlybXdhcmUgYWxzbyBzZXRzICJuby1tYXAiCj4gPiA+ID4gPiAg
ICAgIERUIHByb3BlcnR5IGZvciBmaXJtd2FyZSByZXNlcnZlZCByZWdpb25zLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IDIpIEFkZCBhIG5ldyAibm8tc2F2ZS1yZXN0b3JlIiBEVCBwcm9wZXJ0eSBpbiB0
aGUgcmVzZXJ2ZWQKPiA+ID4gPiA+ICAgICAgbWVtb3J5IERUIGJpbmRpbmdzLiBUaGUgaGliZXJu
YXRlIHN1cHBvcnQgb2YgTGludXggYXJjaC9yaXNjdgo+ID4gPiA+ID4gICAgICB3aWxsIHVzZSB0
aGlzIERUIHByb3BlcnR5IHRvIGV4Y2x1ZGUgbWVtb3J5IHJlZ2lvbnMgZnJvbQo+ID4gPiA+ID4g
ICAgICBzYXZlLXJlc3RvcmUuIFRoZSBFRkkgaW1wbGVtZW50YXRpb24gb2YgRURLMiBhbmQgVS1C
b290Cj4gPiA+ID4gPiAgICAgIHNob3VsZCBkbyB0aGUgZm9sbG93aW5nOgo+ID4gPiA+ID4gICAg
ICAxKSBUcmVhdCBhbGwgbWVtb3J5IGhhdmluZyAibm8tbWFwIiBEVCBwcm9wZXJ0eSBhcyBFRkkK
PiA+ID4gPiA+ICAgICAgICAgIHJlc2VydmVkIG1lbW9yeQo+ID4gPiA+ID4gICAgICAyKSBUcmVh
dCBhbGwgbWVtb3J5IG5vdCBoYXZpbmcgIm5vLW1hcCIgRFQgcHJvcGVydHkgYW5kCj4gPiA+ID4g
PiAgICAgICAgICBub3QgaGF2aW5nICJuby1zYXZlLXJlc3RvcmUiIERUIHByb3BlcnR5IGFzIEVm
aUJvb3RTZXJ2aWNlc0RhdGEKPiA+ID4gPiA+ICAgICAgMykgVHJlYXQgYWxsIG1lbW9yeSBub3Qg
aGF2aW5nICJuby1tYXAiIERUIHByb3BlcnR5IGFuZAo+ID4gPiA+ID4gICAgICAgICAgIGhhdmlu
ZyAibm8tc2F2ZS1yZXN0b3JlIiBEVCBwcm9wZXJ0eSBhcyBFZmlSdW50aW1lU2VydmljZURhdGEK
PiA+ID4gPiA+ICAgICAgICAgICAoUmVmZXIsCj4gPiA+ID4gPiBodHRwczovL2RldmljZXRyZWUt
c3BlY2lmaWNhdGlvbi5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvY2hhcHRlcjMtZGV2aWNlbm9k
ZXMuaHRtbCNyZXNlcnZlZC1tZW1vcnktYW5kLXVlZmkpCj4gPiA+ID4gPgo+ID4gPiA+ID4gUGVy
c29uYWxseSwgSSBhbSBsZWFuaW5nIHRvd2FyZHMgYXBwcm9hY2gjMSBzaW5jZSBhcHByb2FjaCMy
Cj4gPiA+ID4gPiB3aWxsIHJlcXVpcmUgY2hhbmdpbmcgRGV2aWNlVHJlZSBzcGVjaWZpY2F0aW9u
IGFzIHdlbGwuCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IElmIG5lZWRlZCwgaW5kZWVkICMxIGlz
IHRoZSBzaW1wbGVzdCwgYnV0IEkgaW5zaXN0LCB0byBtZSBpdCBpcyBub3QKPiA+ID4gPiBuZWVk
ZWQgKGFuZCB3ZSBkb24ndCBoYXZlIGl0IGluIHRoZSBjdXJyZW50IG9wZW5zYmkpLCBpZiB5b3Ug
aGF2ZQo+ID4gPiA+IGFub3RoZXIgb3BpbmlvbiwgSSdtIG9wZW4gdG8gZGlzY3VzcyBpdCEKPiA+
ID4KPiA+Cj4gPiBUaGUgcHJvYmxlbSB3aXRoIHJlbHlpbmcgb24gdGhlICJtbW9kZV9yZXN2IiBu
YW1lIGlzIHRoYXQgdGhlcmUgd2lsbCBiZQo+ID4gb3RoZXIgdXNlIGNhc2VzIHdoZXJlIGEgcG9y
dGlvbiBvZiB0aGUgbWVtb3J5IG11c3QgYmUgcmVzZXJ2ZWQgYW5kIGFjY2Vzc2luZwo+ID4gdGhh
dCBmcm9tIHRoZSBrZXJuZWwgd2lsbCByZXN1bHQgaW4gZmF1bHQuIENvVkUgaXMgc3VjaCBhIHVz
ZSBjYXNlIHdoZXJlCj4gPiBUU00gd2lsbCBwcm9iYWJseSBydW4gZnJvbSBhIG1lbW9yeSByZWdp
b24gd2l0aCBjb25maWRlbnRpYWwgbWVtb3J5Cj4gPiB3aGljaCB0aGUga2VybmVsIG11c3Qgbm90
IGFjY2Vzcy4KPgo+IFdlIHNob3VsZCBvbmx5IHJlbHkgb24gdGhpcyBub2RlIG5hbWUgZm9yIGtu
b3duIGJhZCB2ZXJzaW9ucyBvZiBvcGVuc2JpCj4gSU1PLiBHb2luZyBmb3J3YXJkLCBpZiBzb21l
dGhpbmcgbmVlZHMgdG8gYmUgcmVzZXJ2ZWQgZm9yIGZpcm13YXJlLCB0aGUKPiBmaXJtd2FyZSBz
aG91bGQgbWFrZSBzdXJlIHRoYXQgaXQgaXMgcmVzZXJ2ZWQgYnkgdXNpbmcgdGhlIHByb3BlcnR5
IGZvcgo+IHRoYXQgcHVycG9zZSA6KQoKVGhlcmUgaXMgbm8gaXNzdWUgd2l0aCBPcGVuU0JJIHNp
bmNlIGl0IGRvZXMgdGhlIHJpZ2h0IHRoaW5nIGJ5IG1hcmtpbmcKbWVtb3J5IGFzIHJlc2VydmVk
IGluIHRoZSBEVC4gVGhpcyByZWFsIGlzc3VlIGlzIHdpdGggdGhlIGtlcm5lbCBoYW5kbGluZwpv
ZiByZXNlcnZlZCBtZW1vcnkgZm9yIGhpYmVybmF0ZS4KCkxpa2UgQXRpc2ggbWVudGlvbmVkLCBu
b3QganVzdCBPcGVuU0JJLCB0aGVyZSB3aWxsIGJlIG90aGVyIGVudGl0aWVzCihsaWtlIFRTTSkg
b3Igc29tZSBvdGhlciBNLW1vZGUgZmlybXdhcmUgd2hpY2ggd2lsbCBhbHNvIHJlc2VydmUKbWVt
b3J5IGluIERUL0FDUEkgc28gY2xlYXJseSBrZXJuZWwgbmVlZHMgYSBTQkkgaW1wbGVtZW50YXRp
b24KaW5kZXBlbmRlbnQgd2F5IG9mIGhhbmRsaW5nIHJlc2VydmVkIG1lbW9yeSBmb3IgaGliZXJu
YXRlLgoKUmVnYXJkcywKQW51cAoKPgo+ID4gV2UgaGF2ZSB0byBuYW1lIGl0ICJtbW9kZV9yZXN2
IiBhcyB3ZWxsIG9yIG1hcmsgaXQgYXMgIm5vLW1hcCIgd2hpY2ggd2lsbAo+ID4gcHJlc2VudCBh
IGhvbGUgaW4gbWFwcGluZ3MuIFdlIHdpbGwgZW5kIHVwIGluIHNhbWUgMUdCIGh1Z2VwYWdlIGlz
c3VlCj4gPiBpZiB3ZSBjaG9vc2UgIm5vLW1hcCIuCj4gPgo+ID4gQW5vdGhlciBvcHRpb24gaXMg
dG8gdXNlIGNvbXBhdGlibGUgc3RyaW5nIG9yIGxhYmVsIHByb3BlcnR5IHRvIGluZGljYXRlCj4g
PiB0aGF0IHRoaXMgbWVtb3J5IHJlZ2lvbiBpcyBub3QgdG8gYmUgc2F2ZWQvcmVzdG9yZWQgZHVy
aW5nIGhpYmVybmF0aW9uLgo+ID4gVGhpcyBjYW4gYmUgZG9jdW1lbnRlZCBpbiBSSVNDLVYgRFQg
YmluZGluZ3MgYXMgd2VsbCBhcyB0aGUgYm9vdGluZyBndWlkZQo+ID4gZG9jIHRoYXQgYWxleCB3
YXMgdGFsa2luZyBhYm91dC4KPgo+IFN1cmUsIGEgZHQtYmluZGluZyBmb3Igc2JpIHJlc2VydmVk
IHJlZ2lvbnMgZG9lc24ndCBpbW1lZGlhdGVseSBzb3VuZAo+IGxpa2UgYW4gYXdmdWwgaWRlYS4u
LiBCdXQgd2Ugc3RpbGwgaGF2ZSB0byB3b3JrIGFyb3VuZCB0aGUgYm9ya2VkCj4gZmlybXdhcmUg
LSBiZSB0aGF0IGRpc2FibGluZyBoaWJlcm5hdGlvbiBvciB1c2luZyB0aGUgbW1vZGVfcmVzdiBu
b2RlCj4gd2hlbiB3ZSBrbm93IHRoYXQgdGhlIHZlcnNpb24gb2YgT3BlblNCSSBpcyBvbmUgb2Yg
dGhvc2Ugd2l0aCB0aGUKPiBwcm9ibGVtLgo+Cj4gPiA+IEkgYWdyZWUgd2l0aCB5b3UsIGJhY2t3
YXJkIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciBmaXJtd2FyZXMKPiA+ID4gaXMgaW1wb3J0YW50
Lgo+ID4gPgo+ID4gVGhpcyBkb2VzIGJyZWFrIHRoZSBjb21wYXRpYmlsaXR5IHdpdGggdGhlIG9s
ZGVyIGZpcm13YXJlIHcuci50byBoaWJlcm5hdGlvbgo+ID4gZmVhdHVyZS4gSG93ZXZlcgo+ID4K
PiA+IEl0IGlzIHNwZWNpZmljIHRvIGhpYmVybmF0aW9uIG9ubHkuIFNvIGhpYmVybmF0aW9uIHdp
bGwgZmFpbCB0byB3b3JrCj4gPiBpZiBhbiB1c2VyIGlzIHJ1bm5pbmcga2VybmVsID4gNi40IGJ1
dCAwLjggPCBPcGVuU0JJIDwgMS4yCj4gPgo+ID4gVGhlIHNhbWUgcHJvYmxlbSBsaWVzIGlmIHVz
ZXJzIHVzZSBvdGhlciBmaXJtd2FyZSB0aGF0IGRvbid0IGhhdmUKPiA+IG5vLW1hcCBwcm9wZXJ0
eSB0b2RheS4gSU1PLCB0aGlzIGNhbiBiZSBkb2N1bWVudGVkIGFzIGEga25vd24gcHJvYmxlbS4K
Pgo+IEknZCByYXRoZXIgd2UgZGlzYWJsZWQgaXQgdGhhbiBkb2N1bWVudGVkIGl0IGFzIGJyb2tl
bi4KPiBPciBkaXNhYmxlIF9hbmRfIGRvY3VtZW50IGl0Lgo+Cj4gPiA+IExldCdzIGdvIHdpdGgg
eW91ciBwcm9wb3NlZCBjaGFuZ2UgdG8gdHJlYXQgcmVzZXJ2ZWQgRFQgbm9kZXMKPiA+ID4gd2l0
aCAibW1vZGVfcmVzdioiIG5hbWUgYXMgTS1tb2RlIGZpcm13YXJlIG1lbW9yeSAoaXQgY291bGQK
PiA+ID4gYmUgYW55IE0tbW9kZSBmaXJtd2FyZSkuIFdlIHdpbGwgY2VydGFpbmx5IG5lZWQgdG8g
ZG9jdW1lbnQgaXQKPiA+ID4gc29tZXdoZXJlIGFzIGFuIGV4cGVjdGF0aW9uIG9mIExpbnV4IFJJ
U0MtViBrZXJuZWwuCj4gPiA+Cj4gPiA+IEBTdW5pbCBIb3cgYWJvdXQgdHJlYXRpbmcgIm1tb2Rl
X3Jlc3YqIiBhcwo+ID4gPiBFZmlSdW50aW1lU2VydmljZURhdGEgaW4gRURLMiA/IE90aGVyIHJl
c2VydmVkIG1lbW9yeQo+ID4gPiBub2RlcyBjYW4gZm9sbG93IHRoZSBkZXZpY2UgdHJlZSBzcGVj
aWZpY2F0aW9uLgo+ID4gPgo+ID4KPiA+IEVpdGhlciB3YXksIHdlIGFsc28gbmVlZCB0byBmaXgg
VS1Cb290IHRvIG1hdGNoIHRoZSBiZWhhdmlvci4gIEN1cnJlbnRseSwKPiA+IGl0IHRyZWF0cyBh
bnkgcmVzZXJ2ZWQgbWVtb3J5IHdpdGhvdXQgbm8tbWFwIHByb3BlcnR5IGFzIEVGSV9CT09UX1NF
UlZJQ0VTX0RBVEEuCj4KPiBDaGVlcnMsCj4gQ29ub3IuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
