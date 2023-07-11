Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9DCEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 11:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tr9qfTMaixQZ7rwwkHXK67EndRC9/s1vjb+H+n9C54o=; b=wBUg3aOJmmvfVJ
	1ULiKs8uQJ5/4ujekK1VKqdt9bx0fDD8M2sKa6sjWWcFIGIRxYeKFoMpmPld2NmjUH6oIuqNYHvsm
	AtD3J+ProdYySdAfvyfzgMY9fDdSLmvc90ewJMhe/6RWajPjZIVWP2acLfxmS6EssTRGRjRSRLrpB
	5uhSlNp+f6/7zAZ2es9Lr3mE9iYtVsgYWGw+73LHh1GWsJl/qy8gCYzJevS2jx+g9vm/AsJgwTJ9a
	gvYPUdG/b1SnGSvroiOTIjuPC+/CwYkKj9aHrH8Kg1LL1PDZKEXgH5fKv3wzhKOv9h2laUWHVgEK/
	CNCvRODTVaCsMHae2bcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBgP-00EmNF-0o;
	Tue, 11 Jul 2023 11:37:29 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBgM-00EmMo-04
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 11:37:27 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-57688a146ecso67526187b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 04:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689075443; x=1691667443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QL2vzMFuW0de7FjZ20tWgQE7hV0B39jdTQg9rjW7/2U=;
        b=dWBQTjEwnfO92CtRKvOWUA0WqWtqTdWFjViuDKPs/E7x2PuJe706BYun5KndDPz/lF
         DF1KVQu4gt7DRlvSKTWNzZ7qQUr7cc66VaLiTn1Isi67ZlRECZ56peEV8aD5KEBR96as
         YdeF9oGk2iVRVOUuqcBIRRlY2TpGcPPd7xQ9yHavO2tV3jU1EUFAmSNBuQdfl5poie9G
         ZrCA1/rnoeWFlFptwMYkOGw2JFw6OI7GFew6/zOG5xJ2bE6T5rkbDJ/a59R7JfBytRpR
         L84kRoIxPqeEcAJVZhRGKOmaW0CrLZMkX4TwZubdKt8yfrAPHze8KwxB8JgfeNIndzk5
         UK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689075443; x=1691667443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QL2vzMFuW0de7FjZ20tWgQE7hV0B39jdTQg9rjW7/2U=;
        b=PMuBJMysY9T624XcjwQKzxwO7FizI5zTl+s5YXARp7+OVqpCOVsWqCarjcnS2GCYkf
         b/0L5Lh5xJqxLHNvBQN2wE5VL4f6X5Lpf3mqdrya3T/L7D9lyAVlkewCNbfX9GkASMNn
         xmgiDeCesbdaePnLWH5FB/aJzJl8vXVfETl94igApBYOBQ6NyQLahNXBshB2InsHx+8E
         Tz0hLvWty6upG0Znw00CE+zdj1tK37+yAl0M0CTP6Jd3CnSbgIGMOdSw76VMKseF9Efy
         Fh7YIr8GhxawPGGGBBx2sC5DlIs65D2XKodb7eY6FCCmnvjgIEu+5DRvv8O9JN+hqH5n
         QuLQ==
X-Gm-Message-State: ABy/qLZRctCohMsX7s7sdsdQupBGtBl9sPgx9IQFuTKKRsMAFpS4ru/+
	zXKb/kDq050TMJtEvqWA47MRfyggrwZdDbZH2ZMkRhkAQzI+YlkL7P4AUQ==
X-Google-Smtp-Source: APBJJlEybCJvpTHFTO7z1IZUbhmlIXArEvmzZz8kIYf+SpxvP87eaGZn+vFC480iQwMfHJMtULU+JkjNjsAjFBNH94I=
X-Received: by 2002:a81:4ed4:0:b0:579:efbb:cbe3 with SMTP id
 c203-20020a814ed4000000b00579efbbcbe3mr13575531ywb.43.1689075442896; Tue, 11
 Jul 2023 04:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230710131902.1459180-1-apatel@ventanamicro.com> <20230711-remission-from-581829b1ff05@wendy>
In-Reply-To: <20230711-remission-from-581829b1ff05@wendy>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 11 Jul 2023 17:07:11 +0530
Message-ID: <CAK9=C2XG9fsvUxnL98gKstxdpdOOAV3UZ3DAV66=S4DJcutzKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Misc RISC-V timer driver improvements
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_043726_089913_42651D58 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgNDo1MeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgMDY6
NDk6MDBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFRoaXMgc2VyaWVzIGRvZXMgdHdv
IGltcHJvdmVtZW50cyB0byB0aGUgUklTQy1WIHRpbWVyIGRyaXZlcjoKPiA+IDEpIEtlZXAgdGlt
ZXIgaW50ZXJydXB0IGVuYWJsZSBzdGF0ZSBpbi1zeW5jIHdpdGggaW50ZXJydXB0IHN1YnN5c3Rl
bQo+ID4gMikgSW5jcmVhc2UgcmF0aW5nIG9mIGNsb2NrIGV2ZW50IGRldmljZSB3aGVuIFNzdGMg
aXMgYXZhaWxhYmxlCj4gPgo+ID4gVGhlc2UgcGF0Y2hlcyBjYW4gYWxzbyBiZSBmb3VuZCBpbiB0
aGUgcmlzY3ZfdGltZXJfaW1wX3YxIGJyYW5jaCBhdDoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9h
dnBhdGVsL2xpbnV4LmdpdAo+Cj4gT3RoZXIgdGhhbiB3b25kZXJpbmcgd2h5IHlvdSBvcHRlZCBm
b3IgNDUwIChjdXJpb3NpdHkgcmVhbGx5KSwgdGhpcwo+IHN0dWZmIGxvb2tzIGZpbmUgdG8gbWUu
CgpJdCBpcyB0aGUgc2FtZSBhcyB0aGUgcmF0aW5nIGZvciBjbG9ja19ldmVudF9kZXZpY2UgdXNl
ZCBieSBBUk0gYXJjaCB0aW1lci4KKFJlZmVyLCBfX2FyY2hfdGltZXJfc2V0dXAoKSBpbiBkcml2
ZXJzL2Nsb2Nrc291cmNlL2FybV9hcmNoX3RpbWVyLmMpCgo+Cj4gUmV2aWV3ZWQtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBDaGVlcnMsCj4gQ29ub3Iu
CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
