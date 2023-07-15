Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79EAEB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 06:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kVjO3n2dSazEujlo1zN2wwJJ++S7KX1u384p9hX/Po=; b=woJ28YIY0VMt27
	nqfaoCgC59lq3HKRD9ukk9Q/UUBbWsQ4ufz0U85ePZ13EmQFj/Lkuv8eaR+ocEHWAdH0I6ikBDyt1
	ovTx/SLPq5xaAeXnPhVvSRYOw/1jhMbleUQWh5ic6nXDMiflqOFf6ZC7E5rkifFXnkkBaD86wmsuT
	QqTJxn00VAW7JJX+vrkXN9H+oCunN/Tg3qZccfWfosJqSRkRlKFDsZ3Rt2I2ZkuR2p+S9IwiCfLBp
	nVOu1IvpU2SomA0fsUXIF7L8RdgSNZiVdqPSx3yOMqUf2DKI2KlKniZrj4EO/eOkivoAzWO89cZsv
	ftQh9TxlGbgLL9cfLs7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKYWp-0080zx-1q;
	Sat, 15 Jul 2023 06:13:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKYWl-0080zR-2h
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 06:13:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1173A60917
	for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 06:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B96C433CA
	for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 06:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689401590;
	bh=RHKR4wc2n8Y2NfM8bn7d2zaNxis53neTbQztYtRTWUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s2MeKl7byg27SYvXC9bDv8IN3dyZLl+eq9OgsRmt1SDzy12IqFyiSb53huI+6vVH4
	 bDUGIV4Gw50dS1sCjMZCIhJWBgtUR9qGiR0itHtWPvjw2DPypW/8efaZSFCuvAOg4f
	 vXsVQfsQ0QH8WLdwA9gVqd9LIlsWP+0wvGV/D4IyDHn7TGElcUU5p3C+v+gzvgOZOD
	 VC7yk8BBbfSEzLiVxZg3ptRCOCktMNrlK/MoRbJ8qCGxqzVyMi9FvF2ZmM8lWfRAwa
	 w3asVl8sTMnFhKIg7Zi64mAxDf7oR7Vz3iHpwBbpjdPtAYOzJ+WAayMIem/Qbe7jFv
	 KGMAZQ2ff1MVg==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99364ae9596so366145966b.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 23:13:10 -0700 (PDT)
X-Gm-Message-State: ABy/qLbem5jCq+P8EGztuFpQ8iZu007c8SRqdw+fdchoWX5VJpZAeqlU
	e8x+V5t2Z4Cu7QbZMsonTGs/p+DjmD+XdAYAiRY=
X-Google-Smtp-Source: APBJJlFPjXrpRXQq7t35hL3iFf0VvDE1QeZFh337d4y2uUlEM3h47ZHbXWU+GroewieXhb5zhtggB/SOKt/Rt4vrlT8=
X-Received: by 2002:a17:907:c84:b0:96f:1f79:c0a6 with SMTP id
 gi4-20020a1709070c8400b0096f1f79c0a6mr5267906ejc.70.1689401588630; Fri, 14
 Jul 2023 23:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-postal-affiliate-0d61a209897f@spud> <20230714-vowel-compound-4161ecb6b48d@spud>
In-Reply-To: <20230714-vowel-compound-4161ecb6b48d@spud>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 15 Jul 2023 14:12:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQVFz+ri2wG49Le--qUe6q_tBL8pDoZ+LQqb8CWTgTySg@mail.gmail.com>
Message-ID: <CAJF2gTQVFz+ri2wG49Le--qUe6q_tBL8pDoZ+LQqb8CWTgTySg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_231311_962887_34A9B283 
X-CRM114-Status: GOOD (  20.41  )
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
Cc: heiko@sntech.de, remi@remlab.net, charlie@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, jszhang@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBKdWwgMTUsIDIwMjMgYXQgMzoyMeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAxMiwgMjAyMyBhdCAwNjo0ODowMlBNICsw
MTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4KPiA+Cj4gPiBUaGUgbGFzdCBtZXJnZSB3aW5kb3cgY29udGFpbmVkIGJv
dGggViBzdXBwb3J0IGFuZCB0aGUgZGVwcmVjYXRpb24gb2YKPiA+IHRoZSByaXNjdixpc2EgRFQg
cHJvcGVydHksIHdpdGggdGhlIFYgaW1wbGVtZW50YXRpb24gcmVhZGluZyByaXNjdixpc2EKPiA+
IHRvIGRldGVybWluZSB0aGUgcHJlc2VuY2Ugb2YgdGhlIFYgZXh0ZW5zaW9uLiAgQXQgdGhlIHRp
bWUgdGhhdCB3YXMgdGhlCj4gPiBvbmx5IHdheSB0byBkbyBpdCwgYnV0IHRoZXJlJ3MgYSBsb3Qg
b2YgYW1iaWd1aXR5IGFyb3VuZCBWIGluIElTQQo+ID4gc3RyaW5ncy4gIEluIHBhcnRpY3VsYXIs
IHRoZXJlIGlzIGEgbG90IG9mIGZpcm13YXJlIGluIHRoZSB3aWxkIHRoYXQKPiA+IHVzZXMgInYi
IGluIHRoZSByaXNjdixpc2EgRFQgcHJvcGVydHkgdG8gY29tbXVuaWNhdGUgc3VwcG9ydCBmb3Ig
dGhlCj4gPiAwLjcuMSB2ZXJzaW9uIG9mIHRoZSBWZWN0b3Igc3BlY2lmaWNhdGlvbiBpbXBsZW1l
bnRlZCBieSBULUhlYWQgQ1BVCj4gPiBjb3Jlcy4KPiA+Cj4gPiBSYXRoZXIgdGhhbiBmb3JjaW5n
IHVzZSBvZiB0aGUgbmV3bHkgYWRkZWQgaW50ZXJmYWNlIHRoYXQgaGFzIHN0cmljdAo+ID4gbWVh
bmluZ3MgZm9yIGV4dGVuc2lvbnMgdG8gZGV0ZWN0IHRoZSBwcmVzZW5jZSBvZiB2ZWN0b3Igc3Vw
cG9ydCwgYXMKPiA+IHRoYXQgd291bGQgcGVuYWxpc2UgdGhvc2Ugd2hvIGhhdmUgYmVoYXZlZCwg
b25seSBpZ25vcmUgdiBpbiByaXNjdixpc2EKPiA+IG9uIENQVXMgdGhhdCByZXBvcnQgVC1IZWFk
J3MgdmVuZG9yIElELgo+ID4KPiA+IEZpeGVzOiBkYzY2NjdhNGU3ZTMgKCJyaXNjdjogRXh0ZW5k
aW5nIGNwdWZlYXR1cmUuYyB0byBkZXRlY3QgVi1leHRlbnNpb24iKQo+ID4gU2lnbmVkLW9mZi1i
eTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiBDby1kZXZlbG9wZWQt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gRnJv
bSBzcGVha2luZyB0byB2YXJpb3VzIHBlb3BsZSBvbiBJUkMsIGFuZCBHdW8gUmVuJ3MgaW5mb3Jt
YXRpb24gdGhhdAo+IHRoZSBjOTA4LCB3aGljaCBzdXBwb3J0cyB0aGUgc3RhbmRhcmQgdmVyc2lv
biBvZiB2ZWN0b3IsIGhhcyBub24temVybwo+IG1hcmNoaWQsIHdlIG1heSBub3QgbmVlZCB0aGlz
IHBhdGNoIGZvciBub3cuCj4gVGhlcmUncyBubyByZWFsIHVyZ2VuY3kgdG8gcHJldmVudCBhIGZ1
dHVyZSByZWdyZXNzaW9uIGluIHN1cHBvcnQgc2luY2UKPiBtYXJjaGlkIHdpbGwgZGlmZmVyIGJl
dHdlZW4gdGhlIGM5MDggYW5kIHRoZSBleGlzdGluZyBjb3JlcyB0aGF0IG9ubHkKPiBzdXBwb3J0
IHRoZSB2MC43LjEgdmVyc2lvbiBvZiB2ZWN0b3IsIHNvIHRoaXMgY291bGQgYmUgYXBwbGllZCBh
dCBvdXIKPiBsZWlzdXJlIElGRiBhbiBpc3N1ZSBkb2VzIGFjdHVhbGx5IGNyb3AgdXAuIEkndmUg
bWFya2VkIGl0IGFzIENoYW5nZXMKPiBSZXF1ZXN0ZWQgb24gcGF0Y2h3b3JrLgpUaHghIFdlIGFn
cmVlIHRoYXQgc3RhbmRhcmQgdmVjdG9yIDEuMCBpcyB0aGUgY29ycmVjdCBkaXJlY3Rpb24gZm9y
IHRoZSBmdXR1cmUuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
