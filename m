Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF749EE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNnLl+/kOxOKi9TC1is5raF7v04loPOs77k7BXVhFd8=; b=ueYxRalmXMFAch
	KSR91R8LcVC72/TGVMUpmlauwaGlVCgs4xP18ZS67QP+8jQbpppvFc/+DBkUhtXHTQajJ8bcmrUpq
	ZOHVtK5TXF2C/LjGtc6garn7/KD6AbeEtevACXPjV6MxPUO9Sckx1Up9ylvOdIJNcOqBIa6m/I+44
	gsTL47RVMk6pYNrkspJR9AhjrbWytXf+rQ98c8bqELIX3qq6LqlCCoaplpimKRa+dksNJ9rpT6IHR
	ff/7jBdao+JS0wG4sSIUPTaWYbP9FwufL4yPIIBJJOcYH0M2SXqo64Hrd8HQOJeaa7C4g2OJrmJTr
	bTn6XPI4977GEuz0oMSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYqq6-00155K-2y;
	Wed, 23 Aug 2023 16:36:14 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYqq3-00154e-1z
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 16:36:13 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-34bad70e7feso1345ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Aug 2023 09:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692808568; x=1693413368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9m2a+kxo2+w7qKe8jRM7p6UxdJW43rH8HZy4IyJwok=;
        b=gQ2tgVX38fk3NKumBYohqLuBGvJdJj5FF7Gvuwtf2a8PfGakeGFsrM3PXTJrR0A9yI
         UspP53O3DoMhe1RvhqbL8SFhq0HLG4+TxUgYuUMrCvZO6p4vDTlyUrVtylxJeUrFlQTp
         uc0J2pwTATyPzP1Fatqbe1fp05o5VWnLJz7uVEdVjZeGP58H+L1vh1Wwb2snH1s5kH1R
         HW7qzJ2PtlTA3rhdC289BKpriyghBS+SkSr0hcxGoPTwBU52mMY0ToOoY3QpJi0o8EyD
         5cYQtzTLbJDmpYb4o5saItl8i7dn/zpFPYKQuvPS88WPgSMiylfmzKzRcZ8q42wxBUci
         Q1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692808568; x=1693413368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9m2a+kxo2+w7qKe8jRM7p6UxdJW43rH8HZy4IyJwok=;
        b=a/5BNNqnc8zvQkfix6/r1j2k+lRNzCNsc57vU1l91QJ2q+nRW7nXR6EB6L50IP/0p/
         HSpsTBnPGPfnaADHBMWpEK5J4SKLtqJI6UKA8D3JTiFqQzaB+h54RaArCe8/4KiF2f1g
         yfnOXFGxwQGRM4o2MMMP8tdU7Dz94K+OPrSlKQPwgly6a7w7O3XOO9xy812UGz11NMwJ
         jR5H+pyM1o2xoibzqLT05s/D2gE7HvaS47CsNC7kjPBSiN9CXljHOoaqSR5EqQ+6mg/b
         EYvae0GYadH1SUx2kzmnVNdLDWuDmh81b6gw00nqhGE/d7IzKf0pxBiSx8hktMtT6eDZ
         sLCA==
X-Gm-Message-State: AOJu0YwrFGm7gRDMD01on9CjGn7rrNUYnOrW4y7IQAjnpLHP+XdNt/TT
	Z/F5BSINsqkwktGWx7fUtxpOn9f6iP6LmMV6LN//Ew==
X-Google-Smtp-Source: AGHT+IF2GtgjXzUG/5FlMjAQdLp/6BkIEUQfwW3gCLdurTVofHBFhITHeDQte3gK3ztFXvQuglmZPBMH3++pdbw3I18=
X-Received: by 2002:a92:cda3:0:b0:33d:6cca:ff8e with SMTP id
 g3-20020a92cda3000000b0033d6ccaff8emr579868ild.22.1692808567849; Wed, 23 Aug
 2023 09:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230822164904.21660-1-andy.chiu@sifive.com> <CAHdA9BxbLyvxObiQqW=M-Rh3PaGqWsdVHUuDc_x5ZZqBOUzhcQ@mail.gmail.com>
In-Reply-To: <CAHdA9BxbLyvxObiQqW=M-Rh3PaGqWsdVHUuDc_x5ZZqBOUzhcQ@mail.gmail.com>
From: Prashanth Swaminathan <prashanthsw@google.com>
Date: Wed, 23 Aug 2023 09:35:57 -0700
Message-ID: <CAHdA9BxEf7b58eYRR7BkLrP9a76DP6k1XTyL3WJA23jCgLUc8A@mail.gmail.com>
Subject: Re: [PATCH] riscv: signal: fix sigaltstack frame size checking
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Mathis Salmen <mathis.salmen@matsal.de>, 
	Guo Ren <guoren@kernel.org>, Andrew Bresticker <abrestic@rivosinc.com>, 
	Vineet Gupta <vineetg@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_093611_659779_F968D62F 
X-CRM114-Status: GOOD (  20.77  )
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

UGVyIEFuZHnigJlzIHJlcXVlc3QsIHJlcGx5aW5nIHRvIHRoaXMgdGhyZWFkIHdpdGggbXkgcmVw
cm9kdWN0aW9uCmluc3RydWN0aW9ucyBhbmQgc29tZSBhZGRpdGlvbmFsIGRhdGEuIEnigJlsbCBh
c2sgZm9yIGZvcmdpdmVuZXNzIGluCmFkdmFuY2UgZm9yIHRoZSByb3VuZGFib3V0IHJlcHJvZHVj
dGlvbiBtZXRob2QsIEnigJltIG5vdCBmYW1pbGlhcgplbm91Z2ggd2l0aCB0aGlzIGNvZGUgdG8g
a25vdyBob3cgdG8gaW50ZW50aW9uYWxseSBpbmR1Y2UgdGhpcyBzdGF0ZSAtCmluIHRoZW9yeSBp
ZiB5b3UgY2FuICgxKSBjYXVzZSBhIGBnZXRfc2lnZnJhbWVgIHRvIGhhcHBlbiBvbiBhIHRocmVh
ZApub3QgT05fU0FTVEFDSywgYW5kICgyKSB5b3UgY2FuIGVuc3VyZSB0aGF0IHRoZSBjdXJyZW50
IGBzcGAgaXMgbGVzcwp0aGFuIHdoYXRldmVyIGlzIGJlaW5nIGhlbGQgYXMgdGhlIGFsdGVybmF0
ZSBzdGFja+KAmXMgYHNwYCAoSeKAmW0gbm90CnN1cmUgd2hhdCBpdCBtZWFucyB0byByZWZlcmVu
Y2UgYGN1cnJlbnQtPnNhc19zc19zcGAgd2hlbiB5b3XigJlyZSBub3QKb24gdGhlIGFsdCBzdGFj
az8pLCB0aGlzIGlzc3VlIHNob3VsZCB0cmlnZ2VyLgoKTXkgcmVwcm9kdWN0aW9uIG1ldGhvZCAo
MTAwJSByYXRlKToKCjEuIEJ1aWxkIEFuZHJvaWQgQU9TUCBwaG9uZSB0YXJnZXQgKGBsdW5jaCBh
b3NwX2NmX3Jpc2N2NjRfcGhvbmUtdXNlcmRlYnVnYCkuCjIuIExhdW5jaCB0aGUgZW11bGF0b3I6
Cmh0dHBzOi8vc291cmNlLmFuZHJvaWQuY29tL2RvY3Mvc2V0dXAvY3JlYXRlL2N1dHRsZWZpc2gt
dXNlCjMuIEFmdGVyIGJvb3QsIHR1cm4gV2lGaSBvbiBhbmQgY29ubmVjdCB0byDigJhWaXJ0V2lm
aeKAmS4gVG8gd2F0Y2ggdGhpcwplcnJvciwgSSBhdHRhY2ggc3RyYWNlIHRvIHRoZSBuZXR3b3Jr
c3RhY2sgUElEIGF0IHRoaXMgcG9pbnQuCjQuIFR1cm4gV2lGaSBvZmYuIFdpdGhpbiBhIGZldyBz
ZWNvbmRzLCB0aGUgbmV0d29ya3N0YWNrIHByb2Nlc3Mgd2lsbApjcmFzaCB3aXRoIGEgU0lHU0VH
Vi4KCkR1bXBpbmcgb3V0IHRoZSB2YXJpYWJsZXMgYXQgdGhlIGNyYXNoIGxvY2F0aW9uOgoKYGBg
CnJlZ3MtPnNwOiA3MjA1NzU2MDY4OTUyNzE4NApzaWdzcDogNzIwNTc1NjA2ODk1MjcxODQKZnJh
bWVzaXplOiAxMDg4CmN1cnJlbnQtPnNhc19zc19zaXplOiAzMjc2OApzcDogNzIwNTc1NjA2ODk1
MjYwOTYKY3VycmVudC0+c2FzX3NzX3NwOiA3MjA1NzU3MDQxNzQ5MTk2OApgYGAKCkFzIHdlIGNh
biBzZWUsIGBzcCA8IGN1cnJlbnQtPnNhc19zc19zcGAgYW5kIHRodXMgdHJpZ2dlcnMgdGhlIGNo
ZWNrLgpXaGF0J3Mgbm90aWNlYWJsZSBoZXJlIHRob3VnaCBpcyB0aGF0IGByZWdzLT5zcGAgYW5k
IGBzaWdzcGAgYXJlCmlkZW50aWNhbCwgd2hpY2ggbWVhbnMgdGhhdCB3aGVuIGBzaWdzcChzcCwg
a3NpZylgIHdhcyBjYWxsZWQsIGl0IGRpZApub3QgZmluZCB0aGF0IGl0IHdhcyBvbiB0aGUgYWx0
ZXJuYXRlIHNpZ25hbCBzdGFjayBhbmQgc2ltcGx5IHJldHVybmVkCmBzcGAgYXMgaXMuIElmIHdl
J3JlIG5vdCBvbiB0aGUgYWx0ZXJuYXRlIHNpZ25hbCBzdGFjaywgdGhlbiB0aGlzCmNoZWNrIGRv
ZXMgbm90IG1ha2Ugc2Vuc2UgLSB0aGUgcmVsYXRpdmUgbG9jYXRpb25zIG9mIHRoZXNlIHR3bwpw
b2ludGVycyBhcmUgbm90IGd1YXJhbnRlZWQuIFdlIHBlcmZvcm0gYSBzaW1pbGFyIGNoZWNrIGF0
IHRoZSB0b3Agb2YKdGhpcyBmdW5jdGlvbiB0aGF0IGRvZXMgdmFsaWRhdGUgd2hldGhlciB3ZSdy
ZSBvbiB0aGUgYWx0c3RhY2sgYmVmb3JlCmF0dGVtcHRpbmcgdGhlIHN1YnNlcXVlbnQgY2hlY2su
CgoKPiBPbiBUdWUsIEF1ZyAyMiwgMjAyMyBhdCA5OjQ54oCvQU0gQW5keSBDaGl1IDxhbmR5LmNo
aXVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+Cj4+IFRoZSBhbHRlcm5hdGl2ZSBzdGFjayBjaGVja2lu
ZyBpbiBnZXRfc2lnZnJhbWUgaW50cm9kdWNlZCBieSB0aGUgVmVjdG9yCj4+IHN1cHBvcnQgaXMg
bm90IG5lZWRlZCBhbmQgaGFzIGEgcHJvYmxlbS4gSXQgaXMgbm90IG5lZWRlZCBhcyB3ZSBoYXZl
Cj4+IGFscmVhZHkgdmFsaWRhdGUgaXQgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgZnVuY3Rpb24g
aWYgd2UgYXJlIGFscmVhZHkKPj4gb24gYW4gYWx0c3RhY2suIElmIG5vdCwgdGhlIHNpemUgb2Yg
YW4gYWx0c3RhY2sgaXMgYWx3YXlzIHZhbGlkYXRlZCBhdAo+PiBpdHMgYWxsb2NhdGlvbiBzdGFn
ZSB3aXRoIHNpZ2FsdHN0YWNrX3NpemVfdmFsaWQoKS4KPj4KPj4gQmVzaWRlcywgd2UgbXVzdCBv
bmx5IHJlZ2FyZCB0aGUgc2l6ZSBvZiBhbiBhbHRzdGFjayBpZiB0aGUgaGFuZGxlciBvZiBhCj4+
IHNpZ25hbCBpcyByZWdpc3RlcmVkIHdpdGggU0FfT05TVEFDSy4gU28sIGJsaW5kbHkgY2hlY2tp
bmcgb3ZlcmZsb3cgb2YKPj4gYW4gYWx0c3RhY2sgaWYgc2FzX3NzX3NpemUgbm90IGVxdWFscyB0
byB6ZXJvIHdpbGwgY2hlY2sgYWdhaW5zdCB3cm9uZwo+PiBzaWduYWwgaGFuZGxlcnMgaWYgb25s
eSBhIHN1YnNldCBvZiBzaWduYWxzIGFyZSByZWdpc3RlcmVkIHdpdGgKPj4gU0FfT05TVEFDSy4K
Pj4KPj4gRml4ZXM6IDhlZTBiNDE4OThmYSAoInJpc2N2OiBzaWduYWw6IEFkZCBzaWdjb250ZXh0
IHNhdmUvcmVzdG9yZSBmb3IgdmVjdG9yIikKPj4gUmVwb3J0ZWQtYnk6IFByYXNoYW50aCBTd2Ft
aW5hdGhhbiA8cHJhc2hhbnRoc3dAZ29vZ2xlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQW5keSBD
aGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9z
aWduYWwuYyB8IDcgLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3NpZ25hbC5jCj4+IGluZGV4IDE4MGQ5NTFkMzYyNC4uMjFhNGQwZTExMWJjIDEwMDY0
NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYwo+PiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zaWduYWwuYwo+PiBAQCAtMzExLDEzICszMTEsNiBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgX191c2VyICpnZXRfc2lnZnJhbWUoc3RydWN0IGtzaWduYWwgKmtzaWcsCj4+ICAgICAgICAg
LyogQWxpZ24gdGhlIHN0YWNrIGZyYW1lLiAqLwo+PiAgICAgICAgIHNwICY9IH4weGZVTDsKPj4K
Pj4gLSAgICAgICAvKgo+PiAtICAgICAgICAqIEZhaWwgaWYgdGhlIHNpemUgb2YgdGhlIGFsdHN0
YWNrIGlzIG5vdCBsYXJnZSBlbm91Z2ggZm9yIHRoZQo+PiAtICAgICAgICAqIHNpZ2ZyYW1lIGNv
bnN0cnVjdGlvbi4KPj4gLSAgICAgICAgKi8KPj4gLSAgICAgICBpZiAoY3VycmVudC0+c2FzX3Nz
X3NpemUgJiYgc3AgPCBjdXJyZW50LT5zYXNfc3Nfc3ApCj4+IC0gICAgICAgICAgICAgICByZXR1
cm4gKHZvaWQgX191c2VyIF9fZm9yY2UgKiktMVVMOwo+PiAtCj4+ICAgICAgICAgcmV0dXJuICh2
b2lkIF9fdXNlciAqKXNwOwo+PiAgfQo+Pgo+PiAtLQo+PiAyLjE3LjEKPj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
