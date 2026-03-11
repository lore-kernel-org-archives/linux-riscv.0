Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AC91125875
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 19:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgAqT2BtpSefegEvlAEjCbeGZxsgQU/VQpIRkiVbsZI=; b=XnFsEF59YJT+IB
	eBoVJiSpyCTkX6rxqz2vAEBikaDLxBikXEy1sXQ14BE+Z20ybDECkXUbCVNCnUHqK4pi5wqZrG/m1
	PV9N8NhRiKsWlhYW5NR6H26rAiOZHML90Uf8PUCL33bDGI5bG7h+oQL3Mo45Aqk7wD6XbanSaid3l
	fgaos7+Ge2Xu82n6aDmGOmQ7G3LxVF7QM7MxHRY0ZCRNZ7h4G0/DruJa6xS+Q/GHW5SuEMG2cRT4L
	AX7QTfoNJ81Xx4n3uEbSeW9FQkPtVBcH+RKTskchMVKGdMHoXu70OcFkbtQN3qL4nCD9jp/CAkoDd
	Erg9+Aq/bB7Xuyppv27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PTm-0000000CO0d-0N9f;
	Wed, 11 Mar 2026 19:44:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PTi-0000000CNzL-3Ocn
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 19:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B10FE44532
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 19:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9603CC2BCB5
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773258261;
	bh=39PeX03cfW+OogOTezHdW5pPVtlIWod9VLbZMi7czDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s+6M41CMEQAx7onDSAvubBk35bOYaeNmb2f/KV3UCl47p5OOXHfmRbfL/P/WpgbXK
	 y6K91LYP5r0lQD03qeiWhZguPkv7WWpJamO5OPlGVcBmw/RWQQL/mg/IslEf6e8LIU
	 rE5B9ErCZMsDIE/InQfUbXNqE/mRRmFlFhs9sU460o9fgJLBABj3GODXDdeIFON3zl
	 l1pv11UB3Atj8JAxKkbq030GS2zWLpTfWhU7Ynmh83Qc7nhPzCbA/TypbJwqI0a1u0
	 Xd1ztlhQ0+Ex/tfgaAKQLXVFMum8hi/8WB4gByx46kcrZHHe0A0w32N8HqSZXX4XuS
	 9d0uq3TuLGnUg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-662fc12ac5bso365230a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 12:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWY4ie9le8wkp8E4sxCNaqcFtiEUQ7VGd/eQS+lsW085LNjCj/Vv4br8ZGnaUwo3Xvdyuml8pyYBc9ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXQ0paYnXJvv+uN0aIZX7+nQwJ+fNbKtZBjcVf+pI+dYzGJQiz
	L9w3C7jBIhRru7KI7wCZYvx5Ns3eQ5m2jCMf4AkhAQ7MlfMGuRizb4wNAsZfrfh5zYoa9pfKcIx
	Ka0GTTHO/Jokyb/utd6bmD0nteAUxxg==
X-Received: by 2002:a17:907:72c2:b0:b8e:d4ed:5ef2 with SMTP id
 a640c23a62f3a-b972e5b211amr251839466b.58.1773258259961; Wed, 11 Mar 2026
 12:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-collar-smokiness-5313aa648a6f@spud>
 <177324727784.4047403.339169143402607624.robh@kernel.org> <20260311-unlovable-ecosphere-07df196823b3@spud>
In-Reply-To: <20260311-unlovable-ecosphere-07df196823b3@spud>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Mar 2026 14:44:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJsP3ySdNJrJ9C-jSc1gKKWPwK0Z4sJjBW0wqvyk5ppjw@mail.gmail.com>
X-Gm-Features: AaiRm50k2V92nCmEywPA1fhJ0QoUN0pDSozwDYs95PdSX28ynGVvAIorcAx8lSw
Message-ID: <CAL_JsqJsP3ySdNJrJ9C-jSc1gKKWPwK0Z4sJjBW0wqvyk5ppjw@mail.gmail.com>
Subject: Re: [PATCH v12 2/4] dt-bindings: soc: microchip: document PolarFire
 SoC's gpio interrupt mux
To: Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Daire McNamara <daire.mcnamara@microchip.com>, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_124422_886128_B7ADD60F 
X-CRM114-Status: GOOD (  21.27  )
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

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgMTI6NTjigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gUm9iLAo+Cj4gT24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgMTE6
NDE6MTdBTSAtMDUwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCAx
MSBNYXIgMjAyNiAxNToxNzozOSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBGcm9t
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gPgo+ID4gPiBP
biBQb2xhckZpcmUgU29DIHRoZXJlIGFyZSBtb3JlIEdQSU8gaW50ZXJydXB0cyB0aGFuIHRoZXJl
IGFyZSBpbnRlcnJ1cHQKPiA+ID4gbGluZXMgYXZhaWxhYmxlIG9uIHRoZSBQTElDLCBhbmQgYSBy
dW50aW1lIGNvbmZpZ3VyYWJsZSBtdXggaXMgdXNlZCB0bwo+ID4gPiBkZWNpZGUgd2hpY2ggaW50
ZXJydXB0cyBhcmUgYXNzaWduZWQgZGlyZWN0IGNvbm5lY3Rpb25zIHRvIHRoZSBQTElDICYKPiA+
ID4gd2hpY2ggYXJlIHJlbGVnYXRlZCB0byBzaGFyaW5nIGEgbGluZS4KPiA+ID4KPiA+ID4gUmV2
aWV3ZWQtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
ID4gPiAtLS0KPiA+ID4gIC4uLi9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxtcGZzLWlycW11eC55
YW1sICB8IDc3ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gIC4uLi9taWNyb2NoaXAsbXBmcy1t
c3MtdG9wLXN5c3JlZy55YW1sICAgICAgICB8ICA0ICsKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
ODEgaW5zZXJ0aW9ucygrKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxtcGZzLWlycW11eC55
YW1sCj4gPiA+Cj4gPgo+ID4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2Jp
bmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cj4KPiBBQUFBQUFBQUEsIGdvZGRhbW1pdC4gSSBm
b3Jnb3QgdGhlcmUgd2FzIGEgcmVhc29uIHdoeSBJIGhhZCBub3QganVzdAo+IHNlbnQgb2ZmIHRo
ZSBuZXcgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLgoKUHJvdmlkaW5nIHJldmlld3Mgb2YgYmluZGlu
Z3MgZW50aXRsZXMgeW91IHRvIGZyZWUgdGVzdGluZyBvZiB5b3VyIHBhdGNoZXMuIDopCgo+ID4g
eWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOgo+ID4KPiA+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9l
cnJvcnM6Cj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL21pY3JvY2hp
cC9taWNyb2NoaXAsbXBmcy1pcnFtdXguZXhhbXBsZS5kdHM6MTguMzMtMjQuMTE6IFdhcm5pbmcg
KGludGVycnVwdF9wcm92aWRlcik6IC9leGFtcGxlLTAvaW50ZXJydXB0LWNvbnRyb2xsZXJANTQ6
ICcjaW50ZXJydXB0LWNlbGxzJyBmb3VuZCwgYnV0IG5vZGUgaXMgbm90IGFuIGludGVycnVwdCBw
cm92aWRlcgo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9taWNyb2No
aXAvbWljcm9jaGlwLG1wZnMtaXJxbXV4LmV4YW1wbGUuZHRiOiBXYXJuaW5nIChpbnRlcnJ1cHRf
bWFwKTogRmFpbGVkIHByZXJlcXVpc2l0ZSAnaW50ZXJydXB0X3Byb3ZpZGVyJwo+Cj4gSSB3YW50
ZWQgdG8gYXNrIGFib3V0IHRoaXMgUm9iLCBJIHdhc24ndCBzdXJlIEkgZnVsbHkgdW5kZXJzdG9v
ZCBpdC4KPiBJIGZpZ3VyZWQgaXQgd2FzIGJlY2F1c2UuLi4KPgo+Cj4gPiAvYnVpbGRzL3JvYmhl
cnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxtcGZzLWlycW11eC5leGFtcGxlLmR0YjogaW50ZXJy
dXB0LWNvbnRyb2xsZXJANTQgKG1pY3JvY2hpcCxtcGZzLWlycW11eCk6ICdpbnRlcnJ1cHQtbWFw
JyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5Cj4gPiAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvYy9taWNyb2NoaXAvbWljcm9jaGlwLG1wZnMtaXJx
bXV4LnlhbWwKPgo+IC4uLkkgaGFkIG5vdCBhZGRlZCB0aGUgaW50ZXJydXB0LW1hcCB5ZXQuLi4K
Clllcy4KCj4gPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxtcGZzLWly
cW11eC5leGFtcGxlLmR0YjogaW50ZXJydXB0LWNvbnRyb2xsZXJANTQgKG1pY3JvY2hpcCxtcGZz
LWlycW11eCk6ICdpbnRlcnJ1cHQtbWFwJyBpcyBhIGRlcGVuZGVuY3kgb2YgJ2ludGVycnVwdC1t
YXAtbWFzaycKPiA+ICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvaW50ZXJydXB0LWNvbnRyb2xsZXIueWFtbAo+ID4gL2J1aWxkcy9yb2JoZXJyaW5n
L2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29j
L21pY3JvY2hpcC9taWNyb2NoaXAsbXBmcy1pcnFtdXguZXhhbXBsZS5kdGI6IGludGVycnVwdC1j
b250cm9sbGVyQDU0IChtaWNyb2NoaXAsbXBmcy1pcnFtdXgpOiAnYW55T2YnIGNvbmRpdGlvbmFs
IGZhaWxlZCwgb25lIG11c3QgYmUgZml4ZWQ6Cj4gPiAgICAgICAnaW50ZXJydXB0LWNvbnRyb2xs
ZXInIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiA+ICAgICAgICdpbnRlcnJ1cHQtbWFwJyBpcyBh
IHJlcXVpcmVkIHByb3BlcnR5Cj4gPiAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL2ludGVycnVwdC1jb250cm9sbGVyLnlhbWwKPgo+IC4uLnNvIHRo
aXMgc2NoZW1hIGNvbXBsYWluZWQuIEJ1dCB3aHkgaXMgdGhlcmUgYSBjdXN0b20gd2FybmluZyBh
Ym91dAo+ICJub2RlIGlzIG5vdCBhbiBpbnRlcnJ1cHQgcHJvdmlkZXIiLCB3aGVuIHRoZSBjb25k
aXRpb25hbCBzY2hlbWEKPiBwcm9kdWNlcyBhIHdhcm5pbmcgb2YgaXRzIG93bj8KClRoZSBmaXJz
dCB3YXJuaW5nIGlzIGZyb20gZHRjLiBUaGVyZSBpcyBzb21lIG92ZXJsYXAgd2l0aCBzY2hlbWEg
Y2hlY2tzLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
