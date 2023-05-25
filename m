Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E1FC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 19:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWKOn9kQ1jiE8sWtNsID11OqTtNOvOtEvCxBWYOuGEI=; b=2ede1uFu2XRQYK
	EZ/W9iSMPA1jNrfI1WR+9jWjeN8vlPDPjZ2+c8597ijzlqfzItntC2tIy07Vhad1l272Tbnq747ep
	+BKtdsS9Ius21iyTYAeHG/xJx4JKxre0Ps9AfBHNpazpB4gt9SmnJjw6dODDCGPd8xGlBd/BX0L8g
	Px8y+UwwjJxRZ3/8U1p133TNKLGwnVa1i4Qs9+u4wjaFiC9WRr+1d/zOc4kk+DT2FFGTdp8ZsXvAs
	41j/cjq1i50W5JGzeXQc/QbZnLRXWZ1JlYxz4BNglghzgYizoMqGetfbLsPif1NjLzwif0C4f43Ng
	9fjHy3G77pz6xitL8rxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2GqB-00HaSj-2C;
	Thu, 25 May 2023 19:41:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2GqA-00HaSP-2Y
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 May 2023 19:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BQFtlRq4aJTYhV0eQW9iMfrGDr0aZKTMQmG9jztszkI=; b=oUjx1cg5E/HjB4g4WaPvlSvL4j
	Eh7SI30pCYRSpzRVFpHYFmZaIYK2G4I0SprG29KWJoq/9SLZxyyQO5xLGG8mPAN8kO6e/lExc+R2w
	FUfAF3SP6e6h3JlsCxIByFDHs9YKFe0JXNG2RUo8xCLFnP3FR56/vR9Ju63s9lDIgLVOMdOzeAtLt
	eY7kmkdcKgChxlgeEQc91fqqcSuGer8nF7+pqv4VzKkNhakTcStaGqM6FUvLDRoGXxD6IwRnrgNH1
	M+s7rA+FSgWgi/AAGUpfv40iTvZUOJxaV1jnPTAKtduikb0iDKxopsvI+RDWz/MvVURW8yW2C9UNQ
	3pfIsZPA==;
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2FqV-006dZx-26
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 18:37:58 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2af316b4515so9347521fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 May 2023 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1685039872; x=1687631872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQFtlRq4aJTYhV0eQW9iMfrGDr0aZKTMQmG9jztszkI=;
        b=aah1yVGWc6dM4uSAh5ergDNyAS76mgeKNaz3HFdI2uZgtSXSakKbODeYGrc4ZvCotO
         4cK1skhilE6T081oNHEUgtaBz7CzPJao91WjipyxkCYbMGIqnMxHTkOzyUe1F1aAPl8V
         LjfcQwUOMtzXroaf3S40RpYLoTG8L+meNms88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685039872; x=1687631872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQFtlRq4aJTYhV0eQW9iMfrGDr0aZKTMQmG9jztszkI=;
        b=CyAVVrWRQmO6zHPDh2uX1+DmjOCDpiJp2NLfmkTRosInB+3H63RjEj6ZsZPwbnxIFZ
         Prw48Bw+2SI/EKeSEDtsDzf1FgDjF3O/guWOPKiUMjN7BoWO9834J41Ogm/QPTtRTZsD
         D990k8BQDiDFrpaQZMGV22hhL29V/Cq+aZsZWnIZZEnLoz89KOQx4+dcC6BIuTSTIAOj
         hcFtpActFIAV1dOu+1aSOXLIkLGf5lf6I0ibFAnf8MLqB1FPrgSEnebmVALNddrtacjg
         EQaMs99DB/cclFMhF151OTo9Q581bhM2BSoawcHzk4OpHx8TuzE2GEmLDlQqvrMQwKPx
         0Khw==
X-Gm-Message-State: AC+VfDxXfLweJQ7zL0I3Gbyfh51XtXb0oDqpHfzihWwbd/HVm1ftCBca
	YySgP3zqaZ+2fqzhT4I1K3exizGgE7kFZZDTvHsVCzUJ1EAXIsM=
X-Google-Smtp-Source: ACHHUZ4SiUCJDYi/eHZ7lZZIC387i25yihp4ohxzNlmqxJ4xLZFOa3yBjwJHhlwwLzLBC3jP8srlTLLSOJgyvbffquI=
X-Received: by 2002:a2e:9a91:0:b0:2af:22a0:81ec with SMTP id
 p17-20020a2e9a91000000b002af22a081ecmr1249470lji.27.1685039871757; Thu, 25
 May 2023 11:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAK9=C2X1BjZCHfYM33pZQtavu7yRqxwsypWL5OWj79bJrnDMQg@mail.gmail.com>
 <CAOnJCULpa-TJuG=TtCDOxOdUviZzWheLE-GMiU1r7GWaKn0nuQ@mail.gmail.com>
 <20230525-guacamole-swimmer-68048a73baac@wendy> <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
 <20230525-postnasal-monopoly-98adb96ffaa1@wendy> <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
 <20230525-shrapnel-precut-26500fca4a48@wendy> <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy> <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
 <20230525-flaring-trading-f2bf0713ae26@spud>
In-Reply-To: <20230525-flaring-trading-f2bf0713ae26@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 25 May 2023 11:37:40 -0700
Message-ID: <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, robh@kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, jeeheng.sia@starfivetech.com, 
	linux-kernel@vger.kernel.org, palmer@rivosinc.com, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_193755_902449_71265B2D 
X-CRM114-Status: GOOD (  45.47  )
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

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMTE6MjLigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGV5IEF0aXNoLAo+Cj4gT24gVGh1LCBNYXkgMjUsIDIwMjMg
YXQgMTA6Mzk6NDRBTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gPiA+IEhvdyBhYm91dCB0
aGUgYmVsb3c/Cj4KPiA+IEluc3RlYWQgb2YgZGlzYWJsaW5nIGhpYmVybmF0ZSBzdXBwb3J0IHdo
eSBub3QgcmV2ZXJ0IHRoZSBwYXRjaAo+ID4gMzMzNTA2OCAoInJpc2N2OiBVc2UgUFVEL1A0RC9Q
R0QgcGFnZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyIpCj4gPiB3aGljaCBkb2Vzbid0IGFkZCBh
bnkgIm1lYXN1cmVkIiB2YWx1ZSBhdCB0aGlzIHBvaW50Lgo+ID4gSG93ZXZlciwga2VlcGluZyB0
aGUgaGliZXJuYXRpb24gZmVhdHVyZSBvbiBhbmQgZGlzYWJsaW5nIGxpbmVhcgo+ID4gbWFwcGlu
ZyB3aWxsIGdldCBtb3JlIHRlc3Rpbmcgb24gaGliZXJuYXRpb24uCj4gPiBXaGlsZSBkaXNhYmxp
bmcgaGliZXJuYXRpb24gYW5kIGtlZXBpbmcgdGhlIGFib3ZlIHBhdGNoIHdoaWNoCj4gPiBkb2Vz
bid0IGhhdmUgYW55IHZhbHVlIGF0IGFsbC4KPiA+Cj4gPiBXZSBkb24ndCBoYXZlIGEgcmVncmVz
c2lvbiBhdCB0aGlzIHBvaW50LiBTbyBlaXRoZXIgYXBwcm9hY2ggd2lsbCB3b3JrIHRob3VnaC4K
Pgo+IEkgZmF2b3VyZWQgdGhpcyBhcHByb2FjaCBzbyB0aGF0IHdlIGRvIG5vdCByZWxlYXNlIGEg
a2VybmVsIGluIHdoaWNoCj4gaGliZXJuYXRlIHdvcmtzIGZvciB0aGVzZSB2ZXJzaW9ucyBvZiBP
cGVuU0JJIGFuZCB0aGVuIHN0b3BzIHdvcmtpbmcgaW4KPiB0aGUgZnV0dXJlIHdoZW4gd2Ugc2hv
cmUgdXAgaG93IGNvbW11bmljYXRpbmcgdGhpcyBpcyBzdXBwb3NlZCB0byB3b3JrLgo+IEl0IGFs
bG93cyB1cyB0byBmaXggdGhlIHByb2JsZW0gInByb3Blcmx5IiBpbiBzbG93LXRpbWUsIGluc3Rl
YWQgb2YKPiByYWNpbmcgYWdhaW5zdCB2Ni40J3MgcmVsZWFzZS4KPgoKRmFpciBlbm91Z2guCgo+
IEkgaGFwcGVuZWQgdG8gYmUgdGFsa2luZyB0byBQYWxtZXIgYW5kIGhlIHN1Z2dlc3RlZCBtYWtp
bmcgaXQgZGVwZW5kIG9uCj4gTk9OUE9SVEFCTEU6Cj4gfD4gY29uZmlnIE5PTlBPUlRBQkxFCj4g
fD4gICAgICBib29sICJBbGxvdyBjb25maWd1cmF0aW9ucyB0aGF0IHJlc3VsdCBpbiBub24tcG9y
dGFibGUga2VybmVscyIKPiB8PiAgICAgIGhlbHAKPiB8PiAgICAgICAgUklTQy1WIGtlcm5lbCBi
aW5hcmllcyBhcmUgY29tcGF0aWJsZSBiZXR3ZWVuIGFsbCBrbm93biBzeXN0ZW1zCj4gfD4gICAg
ICAgIHdoZW5ldmVyIHBvc3NpYmxlLCBidXQgdGhlcmUgYXJlIHNvbWUgdXNlIGNhc2VzIHRoYXQg
Y2FuIG9ubHkgYmUKPiB8PiAgICAgICAgc2F0aXNmaWVkIGJ5IGNvbmZpZ3VyYXRpb25zIHRoYXQg
cmVzdWx0IGluIGtlcm5lbCBiaW5hcmllcyB0aGF0IGFyZQo+IHw+ICAgICAgICBub3QgcG9ydGFi
bGUgYmV0d2VlbiBzeXN0ZW1zLgo+IHw+Cj4gfD4gICAgICAgIFNlbGVjdGluZyBOIGRvZXMgbm90
IGd1YXJhbnRlZSBrZXJuZWxzIHdpbGwgYmUgcG9ydGFibGUgdG8gYWxsIGtub3duCj4gfD4gICAg
ICAgIHN5c3RlbXMuICBTZWxlY3RpbmcgYW55IG9mIHRoZSBvcHRpb25zIGd1YXJkZWQgYnkgTk9O
UE9SVEFCTEUgd2lsbAo+IHw+ICAgICAgICByZXN1bHQgaW4ga2VybmVsIGJpbmFyaWVzIHRoYXQg
YXJlIHVubGlrZWx5IHRvIGJlIHBvcnRhYmxlIGJldHdlZW4KPiB8PiAgICAgICAgc3lzdGVtcy4K
PiB8Pgo+IHw+ICAgICAgICBJZiB1bnN1cmUsIHNheSBOLgo+Cj4gSSBhY3R1YWxseSB0aGluayB0
aGF0IHRoYXQgbWFrZXMgbW9yZSBzZW5zZSwgYXMgaXQgbWF5IGFjdHVhbGx5IGJlIGZpbmUKPiB0
byB1c2UgaGliZXJuYXRpb24gZGVwZW5kaW5nIG9uIHdoYXQgeW91ciBTQkkgaW1wbGVtZW50YXRp
b24gZG9lcy4KPgoKVGhhdCB3b3JrcyB0b28uCgo+ID4gSWYgd2UgY2hvb3NlIHRvIGdvIHRoaXMg
cm91dGUsIHNvbWUgdGhvdWdodHMgYWJvdXQgdGhlIGNvbW1pdCBtZXNzYWdlLgo+ID4gPiAtLSA+
OCAtLQo+ID4gPiBGcm9tIDFkNDM4MTI5MGExNjAwZWZmOWIyOWI4YWNlNmJlNzM5NTVkOTcyNmMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiA+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3Iu
ZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiA+IERhdGU6IFRodSwgMjUgTWF5IDIwMjMgMTU6MDk6
MDggKzAxMDAKPiA+ID4gU3ViamVjdDogW1BBVENIXSBSSVNDLVY6IG1hcmsgaGliZXJuYXRpb24g
YXMgYnJva2VuCj4gPiA+Cj4gPiA+IEhpYmVybmF0aW9uIHN1cHBvcnQgZGVwZW5kcyBvbiBmaXJt
d2FyZSBtYXJraW5nIGl0cyByZXNlcnZlZAo+ID4gPiByZWdpb25zIGFzIG5vdCBtYXBwYWJsZSBi
eSBMaW51eC4gQXMgdGhpbmdzIHN0YW5kLCB0aGUgZGUtZmFjdG8gU0JJCj4gPgo+ID4gZWl0aGVy
IG5vdCBtYXBwYWJsZSBvciBubyBzYXZlL3Jlc3RvcmUgY2FwYWJsZSAoYXMgV2Ugc3RpbGwgaGF2
ZSBub3QKPiA+IGNvbmNsdWRlZCB3aGljaCB3YXkgd2Ugd2FudCB0byBnbyBpbikKPgo+IHMvbWFw
cGFibGUvYWNjZXNzaWJsZS8/IFNvdW5kcyBsaWtlIGEgZ29vZCBjYXRjaCBhbGw/Cj4KClllYWgu
Cgo+ID4KPiA+ID4gaW1wbGVtZW50YXRpb24gKE9wZW5TQkkpIGRvZXMgbm90IGRvIHRoaXMsIGFu
ZCBvdGhlciBpbXBsZW1lbnRhdGlvbnMgbWF5Cj4gPiA+IG5vdCBkbyBzbyBlaXRoZXIsIHJlc3Vs
dGluZyBpbiBrZXJuZWwgcGFuaWNzIGR1cmluZyBoaWJlcm5hdGlvbiAoWzFdLAo+ID4gPiBbMl0p
Lgo+ID4gPgo+ID4KPiA+IHdlIHNob3VsZCBwcm9iYWJseSBhZGQgbW9yZSBjb250ZXh0IGluIHRo
ZSBjb21taXQgbWVzc2FnZS4KPiA+IEhvdyBhYm91dCBhZGRpbmcgc29tZXRoaW5nIGFsb25nIHRo
ZXNlIGxpbmVzOgo+ID4KPiA+IEFzIHRoaW5ncyBzdGFuZCwgdGhlIGxhdGVzdCB2ZXJzaW9uIG9m
IGRlLWZhY3RvIFNCSQo+ID4gaW1wbGVtZW50YXRpb24oT3BlblNCSSkgZG9lc24ndAo+ID4gZG8g
dGhpcyBhbnkgbW9yZSB0byBhbGxvdyAxRyBodWdlIHBhZ2UgbWFwcGluZ3MgYnkga2VybmVsLiBP
dGhlciBTQkkKPiA+IGltcGxlbWVudGF0aW9ucyBhcmUgcHJvYmFibHkKPiA+IGRvaW5nIHRoZSBz
YW1lLiBVbnRpbCB0aGUgY29tbWl0IDMzMzUwNjggKCJyaXNjdjogVXNlIFBVRC9QNEQvUEdECj4g
PiBwYWdlcyBmb3IgdGhlIGxpbmVhciBtYXBwaW5nIiksCj4gPiB0aGUgZmlyc3QgMk1CIHJlZ2lv
biBvZiBEUkFNICh3aGVyZSB0aGUgdHlwaWNhbGx5IGZpcm13YXJlIHJlc2lkZXMpCj4gPiB3YXMg
bm90IG1hcHBhYmxlIGJ5IGtlcm5lbC4gSG93ZXZlciwKPiA+IGVuYWJsaW5nIHRoYXQgbWFwcGlu
ZyByZXN1bHRlZCBpbiB0aGUga2VybmVsIHBhbmljcyBkdXJpbmcgaGliZXJuYXRpb24KPiA+IChb
MV0sIFsyXSkgYXMgdGhlIGhpYmVybmF0aW9uIHByb2Nlc3MKPiA+IHRyaWVzIHRvIHNhdmUvcmVz
dG9yZSBhbnkgbWFwcGVkIHJlZ2lvbiBldmVuIHRob3VnaCBpdCBpcyBtYXJrZWQgYXMgcmVzZXJ2
ZWQuCj4KPiBTR1RNLCBJIGNvdWxkIGdvIHdpdGggdGhhdC4KPgo+ID4gPiBEaXNhYmxlIHN1cHBv
cnQgZm9yIGhpYmVybmF0aW9uIHVudGlsIHN1Y2ggdGltZSB0aGF0IGFuIFNCSQo+ID4gPiBpbXBs
ZW1lbnRhdGlvbiBpbmRlcGVuZGVudCB3YXkgdG8gY29tbXVuaWNhdGUgd2hhdCByZWdpb25zIGFy
ZSByZXNlcnZlZAo+ID4gPiBoYXMgYmVlbiBhZ3JlZWQgdXBvbi4KPiA+ID4KPiA+Cj4gPiBBbnli
b2R5IHdobyB3YW50cyB0byB0ZXN0IHRoZSBoaWJlcm5hdGlvbiBmZWF0dXJlIG11c3QgcmV2ZXJ0
IHRoZQo+ID4gYWJvdmUgbWVudGlvbmVkIHBhdGNoIGFsb25nIHdpdGggdHVybmluZyBvbgo+ID4g
dGhlIGNvbmZpZy4KPgo+IFRoaXMgZ29lcyBhd2F5IHdpdGggdGhlIHVzZSBvZiBub24tcG9ydGFi
bGUsIGFsdGhvdWdoIEkgd291bGQgd29yawo+IG1lbnRpb24gb2YgdGhlIGNvbmZpZyBvcHRpb24g
aW50byB0aGUgY29tbWl0IG1lc3NhZ2UuCj4KCkFueSB0ZXN0aW5nIG9mIGhpYmVybmF0aW9uIHN0
aWxsIG5lZWRzIHRvIHJldmVydCB0aGUgcGF0Y2ggdW50aWwgd2UKaGF2ZSB0aGUgcHJvcGVyIGZp
eC4KCj4gVGhhbmtzLAo+IENvbm9yLgo+Cj4gPiA+IFJlcG9ydGVkLWJ5OiBTb25nIFNodWFpIDxz
dWFncmZpbGxldEBnbWFpbC5jb20+Cj4gPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC9DQUFZczI9Z1F2a2hUZWlvTW1xUkRWR2pkdE5GX3ZoQit2bV8xZEhKeFBOaTc1WURRX1FA
bWFpbC5nbWFpbC5jb20vIFsxXQo+ID4gPiBSZXBvcnRlZC1ieTogSmVlSGVuZyBTaWEgPGplZWhl
bmcuc2lhQHN0YXJmaXZldGVjaC5jb20+Cj4gPiA+IExpbms6IGh0dHBzOi8vZ3JvdXBzLmdvb2ds
ZS5jb20vYS9ncm91cHMucmlzY3Yub3JnL2cvc3ctZGV2L2MvSVRYd2FLZkE2ejgKPiA+ID4gU2ln
bmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgfCAyICstCj4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiBpbmRleCAx
M2YwNTg0OTA2MDguLmIyNDk1MTkyZjM1YSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9L
Y29uZmlnCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiBAQCAtODAxLDcgKzgw
MSw3IEBAIG1lbnUgIlBvd2VyIG1hbmFnZW1lbnQgb3B0aW9ucyIKPiA+ID4gIHNvdXJjZSAia2Vy
bmVsL3Bvd2VyL0tjb25maWciCj4gPiA+Cj4gPiA+ICBjb25maWcgQVJDSF9ISUJFUk5BVElPTl9Q
T1NTSUJMRQo+ID4gPiAtICAgICAgIGRlZl9ib29sIHkKPiA+ID4gKyAgICAgICBkZWZfYm9vbCBu
Cj4gPiA+Cj4gPiA+ICBjb25maWcgQVJDSF9ISUJFUk5BVElPTl9IRUFERVIKPiA+ID4gICAgICAg
ICBkZWZfYm9vbCBISUJFUk5BVElPTgo+CgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
