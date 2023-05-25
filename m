Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14003C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bg/1aAZG7nP0c0Wglw806A6tSSgYrLFSYYYpHACYNBo=; b=xRwlTvyg2w9FRx
	gbComCneeJrjR/VwGvXVBa/3fH7XAkhe4sE3iZWFYUfuvoAn2wvjn93Fu/BCqHPwznaGOT1bx+dTm
	J7nRaExep9wX/C+xQ0JGJj9t7vo1ccGXxXh/Dw7gqJRMJLaih72Uhc1O0qRx90meGLVl2YK9fPEu7
	Xb6Ip0f7aMdhv3KW93pD55EWB4OVe8nTN10W1BDXR65Ko1wd3Kp7edhhEA8jdA7Rris1SkwIuRWZ3
	65dMTPy50+oceQzy9RmTiGv3SQBAJ/n4S+mfxoWsUigV/R5p9S59kR1XFZYREWEx3yXiSu/ToZEdA
	jptEKCO65DR+9AixdxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Ewd-00HGhH-09;
	Thu, 25 May 2023 17:40:11 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2EwZ-00HGfa-2B
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 17:40:09 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso2721507e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 May 2023 10:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1685036396; x=1687628396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvotGdSeJEkge/b3ttPXelgK85DYS8pQFKgHga3n2Gg=;
        b=L7s7f6E/roTH2qqgoVMKc9eoLjSfY0CTExLwLbLMz9L9WKDU4qNU4wPFiLZGPzGXKT
         qNv051C65wDRnArtGqPKM8t+QVH+MkRzjMvkGQ3Wlv6nqQPNB6hmt9JP7bHNegHJkMw9
         y/P4aO0V555E+WaHY0x/OTi/en+RY03zmtcd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685036396; x=1687628396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvotGdSeJEkge/b3ttPXelgK85DYS8pQFKgHga3n2Gg=;
        b=ZTfWOq5y04CdpvZDBLJ2d6hrmkIbaJjuTY6DcHCimKKnFixObMAeRwS2isAxsrlHK+
         et8DtAYJB5G+hSMMbE4srb4QVFV4sqsTVSPPvRI9aInqEQyesX/OiqjumlL3esj/b6HU
         E/99dHjAfrSw2WHu+BZhTOS5wOG4vf2J9Fnw+BZjkflNmqpVgdeOqQBSzOhVAp1SD4EM
         Xz0YNk2yeh87Fw9zKKJEUnDbOyMGR7+zU1xonODSYB9ic10CNFXvuYWgjYhMlWd2f1eD
         VerTaXaUeh4ct3ZsfH5SfSbiNA7Nuk18n23BAOneBHbgnt3zKROXfSW7Ry+L/Ql5L+ML
         07lA==
X-Gm-Message-State: AC+VfDwDGJ7yfDSJ17uNxNJgM8uoejJ6ShlluSqtzRfMZpyPCEPkoKjJ
	pOWTMmMLs2DodOoM0wyB8AX6anF1MXdamxEI4V8U
X-Google-Smtp-Source: ACHHUZ4asHjlRHQo9glk94sftK3Yhg4i4wdzARQcQ2m9eykg4+/R+RNtCbER9ZlasWSTbQ0fkuULO9/hWVZ/oEYfn/k=
X-Received: by 2002:a05:651c:116:b0:2aa:474f:16e with SMTP id
 a22-20020a05651c011600b002aa474f016emr1095376ljb.30.1685036396440; Thu, 25
 May 2023 10:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <fe8d716c-fb4f-1f3f-6c69-de1d8b9fb6af@ghiti.fr> <CAK9=C2X1BjZCHfYM33pZQtavu7yRqxwsypWL5OWj79bJrnDMQg@mail.gmail.com>
 <CAOnJCULpa-TJuG=TtCDOxOdUviZzWheLE-GMiU1r7GWaKn0nuQ@mail.gmail.com>
 <20230525-guacamole-swimmer-68048a73baac@wendy> <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
 <20230525-postnasal-monopoly-98adb96ffaa1@wendy> <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
 <20230525-shrapnel-precut-26500fca4a48@wendy> <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy>
In-Reply-To: <20230525-citric-waged-a2f78d27eb0c@wendy>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 25 May 2023 10:39:44 -0700
Message-ID: <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Anup Patel <anup@brainfault.org>, Anup Patel <apatel@ventanamicro.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, robh@kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org, 
	palmer@rivosinc.com, leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_104007_963227_902E423A 
X-CRM114-Status: GOOD (  38.59  )
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

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgNzoyMeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDc6
Mjk6NDZQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDI1LCAyMDIz
IGF0IDc6MjbigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDc6MTM6MTFQTSArMDUz
MCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCA3OjA4
4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDY6NTE6MjhQTSArMDUz
MCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gV2Ugc2hvdWxkIG9u
bHkgcmVseSBvbiB0aGlzIG5vZGUgbmFtZSBmb3Iga25vd24gYmFkIHZlcnNpb25zIG9mIG9wZW5z
YmkKPiA+ID4gPiA+ID4gPiBJTU8uIEdvaW5nIGZvcndhcmQsIGlmIHNvbWV0aGluZyBuZWVkcyB0
byBiZSByZXNlcnZlZCBmb3IgZmlybXdhcmUsIHRoZQo+ID4gPiA+ID4gPiA+IGZpcm13YXJlIHNo
b3VsZCBtYWtlIHN1cmUgdGhhdCBpdCBpcyByZXNlcnZlZCBieSB1c2luZyB0aGUgcHJvcGVydHkg
Zm9yCj4gPiA+ID4gPiA+ID4gdGhhdCBwdXJwb3NlIDopCj4gPiA+ID4gPgo+ID4gPiA+ID4gPiBU
aGVyZSBpcyBubyBpc3N1ZSB3aXRoIE9wZW5TQkkgc2luY2UgaXQgZG9lcyB0aGUgcmlnaHQgdGhp
bmcgYnkgbWFya2luZwo+ID4gPiA+ID4gPiBtZW1vcnkgYXMgcmVzZXJ2ZWQgaW4gdGhlIERULiBU
aGlzIHJlYWwgaXNzdWUgaXMgd2l0aCB0aGUga2VybmVsIGhhbmRsaW5nCj4gPiA+ID4gPiA+IG9m
IHJlc2VydmVkIG1lbW9yeSBmb3IgaGliZXJuYXRlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgZG9u
J3QgdGhpbmsgd2UgYXJlIHRhbGtpbmcgYWJvdXQgdGhlIHNhbWUgdGhpbmcgaGVyZS4gSSBtZWFu
dCB0aGUKPiA+ID4gPiA+IG5vLW1hcCBwcm9wZXJ0eSB3aGljaCBPcGVuU0JJIGRvZXMgbm90IHNl
dC4KPiA+ID4gPgo+ID4gPiA+IFllcywgd2UgYXJlIHRhbGtpbmcgYWJvdXQgdGhlIHNhbWUgdGhp
bmcuIEl0J3Mgbm90IGp1c3QgT3BlblNCSSBub3QKPiA+ID4gPiBzZXR0aW5nIG5vLW1hcCBwcm9w
ZXJ0eSBpbiByZXNlcnZlZCBtZW1vcnkgbm9kZSBiZWNhdXNlIG90aGVyCj4gPiA+ID4gU0JJIGlt
cGxlbWVudGF0aW9ucyB3b3VsZCBiZSBkb2luZyB0aGUgc2FtZSB0aGluZyAoaS5lLiBub3Qgc2V0
dGluZwo+ID4gPiA+IG5vLW1hcCBwcm9wZXJ0eSkKPiA+ID4KPiA+ID4gT3RoZXIgU0JJIGltcGxl
bWVudGF0aW9ucyBkb2luZyB0aGUgc2FtZSB0aGluZyBkb2Vzbid0IG1ha2UgaXQgYW55IG1vcmUK
PiA+ID4gY29ycmVjdCB0aG91Z2gsIHJpZ2h0Pwo+ID4KPiA+IExpa2UgbXVsdGlwbGUgZm9sa3Mg
c3VnZ2VzdGVkLCB3ZSBuZWVkIERUIGJpbmRpbmcgZm9yIGRpc3Rpbmd1aXNoaW5nCj4gPiBmaXJt
d2FyZSByZXNlcnZlZCBtZW1vcnkgZnJvbSBvdGhlciByZXNlcnZlZCBtZW1vcnkuCj4KPiBBbmQg
SSBoYXZlIGFncmVlZCB3aXRoIG11bHRpcGxlIHRpbWVzIQo+Cj4gPiBVbnRpbCB0aGF0Cj4gPiBo
YXBwZW5zIHdlIHNob3VsZCBlaXRoZXIgbWFyayBoaWJlcm5hdGUgc3VwcG9ydCBhcyBleHBlcmlt
ZW50YWwKPiA+IG9yIHJldmVydCBpdC4KPgo+IFRoYXQgd29ya3MgZm9yIG1lLiBIb3cgYWJvdXQg
dGhlIGJlbG93Pwo+CgpJbnN0ZWFkIG9mIGRpc2FibGluZyBoaWJlcm5hdGUgc3VwcG9ydCB3aHkg
bm90IHJldmVydCB0aGUgcGF0Y2gKMzMzNTA2OCAoInJpc2N2OiBVc2UgUFVEL1A0RC9QR0QgcGFn
ZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyIpCndoaWNoIGRvZXNuJ3QgYWRkIGFueSAibWVhc3Vy
ZWQiIHZhbHVlIGF0IHRoaXMgcG9pbnQuCkhvd2V2ZXIsIGtlZXBpbmcgdGhlIGhpYmVybmF0aW9u
IGZlYXR1cmUgb24gYW5kIGRpc2FibGluZyBsaW5lYXIKbWFwcGluZyB3aWxsIGdldCBtb3JlCnRl
c3Rpbmcgb24gaGliZXJuYXRpb24uIFdoaWxlIGRpc2FibGluZyBoaWJlcm5hdGlvbiBhbmQga2Vl
cGluZyB0aGUgYWJvdmUgcGF0Y2gKd2hpY2ggZG9lc24ndCBoYXZlIGFueSB2YWx1ZSBhdCBhbGwu
CgpXZSBkb24ndCBoYXZlIGEgcmVncmVzc2lvbiBhdCB0aGlzIHBvaW50LiBTbyBlaXRoZXIgYXBw
cm9hY2ggd2lsbCB3b3JrIHRob3VnaC4KCklmIHdlIGNob29zZSB0byBnbyB0aGlzIHJvdXRlLCBz
b21lIHRob3VnaHRzIGFib3V0IHRoZSBjb21taXQgbWVzc2FnZS4KPiAtLSA+OCAtLQo+IEZyb20g
MWQ0MzgxMjkwYTE2MDBlZmY5YjI5YjhhY2U2YmU3Mzk1NWQ5NzI2YyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
Pgo+IERhdGU6IFRodSwgMjUgTWF5IDIwMjMgMTU6MDk6MDggKzAxMDAKPiBTdWJqZWN0OiBbUEFU
Q0hdIFJJU0MtVjogbWFyayBoaWJlcm5hdGlvbiBhcyBicm9rZW4KPgo+IEhpYmVybmF0aW9uIHN1
cHBvcnQgZGVwZW5kcyBvbiBmaXJtd2FyZSBtYXJraW5nIGl0cyByZXNlcnZlZAo+IHJlZ2lvbnMg
YXMgbm90IG1hcHBhYmxlIGJ5IExpbnV4LiBBcyB0aGluZ3Mgc3RhbmQsIHRoZSBkZS1mYWN0byBT
QkkKCmVpdGhlciBub3QgbWFwcGFibGUgb3Igbm8gc2F2ZS9yZXN0b3JlIGNhcGFibGUgKGFzIFdl
IHN0aWxsIGhhdmUgbm90CmNvbmNsdWRlZCB3aGljaCB3YXkgd2Ugd2FudCB0byBnbyBpbikKCj4g
aW1wbGVtZW50YXRpb24gKE9wZW5TQkkpIGRvZXMgbm90IGRvIHRoaXMsIGFuZCBvdGhlciBpbXBs
ZW1lbnRhdGlvbnMgbWF5Cj4gbm90IGRvIHNvIGVpdGhlciwgcmVzdWx0aW5nIGluIGtlcm5lbCBw
YW5pY3MgZHVyaW5nIGhpYmVybmF0aW9uIChbMV0sCj4gWzJdKS4KPgoKd2Ugc2hvdWxkIHByb2Jh
Ymx5IGFkZCBtb3JlIGNvbnRleHQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgpIb3cgYWJvdXQgYWRk
aW5nIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lczoKCkFzIHRoaW5ncyBzdGFuZCwgdGhlIGxh
dGVzdCB2ZXJzaW9uIG9mIGRlLWZhY3RvIFNCSQppbXBsZW1lbnRhdGlvbihPcGVuU0JJKSBkb2Vz
bid0CmRvIHRoaXMgYW55IG1vcmUgdG8gYWxsb3cgMUcgaHVnZSBwYWdlIG1hcHBpbmdzIGJ5IGtl
cm5lbC4gT3RoZXIgU0JJCmltcGxlbWVudGF0aW9ucyBhcmUgcHJvYmFibHkKZG9pbmcgdGhlIHNh
bWUuIFVudGlsIHRoZSBjb21taXQgMzMzNTA2OCAoInJpc2N2OiBVc2UgUFVEL1A0RC9QR0QKcGFn
ZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyIpLAp0aGUgZmlyc3QgMk1CIHJlZ2lvbiBvZiBEUkFN
ICh3aGVyZSB0aGUgdHlwaWNhbGx5IGZpcm13YXJlIHJlc2lkZXMpCndhcyBub3QgbWFwcGFibGUg
Ynkga2VybmVsLiBIb3dldmVyLAplbmFibGluZyB0aGF0IG1hcHBpbmcgcmVzdWx0ZWQgaW4gdGhl
IGtlcm5lbCBwYW5pY3MgZHVyaW5nIGhpYmVybmF0aW9uCihbMV0sIFsyXSkgYXMgdGhlIGhpYmVy
bmF0aW9uIHByb2Nlc3MKdHJpZXMgdG8gc2F2ZS9yZXN0b3JlIGFueSBtYXBwZWQgcmVnaW9uIGV2
ZW4gdGhvdWdoIGl0IGlzIG1hcmtlZCBhcyByZXNlcnZlZC4KCgo+IERpc2FibGUgc3VwcG9ydCBm
b3IgaGliZXJuYXRpb24gdW50aWwgc3VjaCB0aW1lIHRoYXQgYW4gU0JJCj4gaW1wbGVtZW50YXRp
b24gaW5kZXBlbmRlbnQgd2F5IHRvIGNvbW11bmljYXRlIHdoYXQgcmVnaW9ucyBhcmUgcmVzZXJ2
ZWQKPiBoYXMgYmVlbiBhZ3JlZWQgdXBvbi4KPgoKQW55Ym9keSB3aG8gd2FudHMgdG8gdGVzdCB0
aGUgaGliZXJuYXRpb24gZmVhdHVyZSBtdXN0IHJldmVydCB0aGUKYWJvdmUgbWVudGlvbmVkIHBh
dGNoIGFsb25nIHdpdGggdHVybmluZyBvbgp0aGUgY29uZmlnLgoKPiBSZXBvcnRlZC1ieTogU29u
ZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC9DQUFZczI9Z1F2a2hUZWlvTW1xUkRWR2pkdE5GX3ZoQit2bV8xZEhKeFBOaTc1
WURRX1FAbWFpbC5nbWFpbC5jb20vIFsxXQo+IFJlcG9ydGVkLWJ5OiBKZWVIZW5nIFNpYSA8amVl
aGVuZy5zaWFAc3RhcmZpdmV0ZWNoLmNvbT4KPiBMaW5rOiBodHRwczovL2dyb3Vwcy5nb29nbGUu
Y29tL2EvZ3JvdXBzLnJpc2N2Lm9yZy9nL3N3LWRldi9jL0lUWHdhS2ZBNno4Cj4gU2lnbmVkLW9m
Zi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAtLS0KPiAg
YXJjaC9yaXNjdi9LY29uZmlnIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCAxM2YwNTg0OTA2MDguLmIyNDk1MTkyZjM1YSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiBAQCAtODAxLDcgKzgwMSw3IEBAIG1lbnUgIlBvd2VyIG1hbmFnZW1lbnQgb3B0aW9ucyIKPiAg
c291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKPgo+ICBjb25maWcgQVJDSF9ISUJFUk5BVElP
Tl9QT1NTSUJMRQo+IC0gICAgICAgZGVmX2Jvb2wgeQo+ICsgICAgICAgZGVmX2Jvb2wgbgo+Cj4g
IGNvbmZpZyBBUkNIX0hJQkVSTkFUSU9OX0hFQURFUgo+ICAgICAgICAgZGVmX2Jvb2wgSElCRVJO
QVRJT04KPiAtLQo+IDIuMzkuMgo+CgoKLS0KUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
