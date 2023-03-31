Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DEBC761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSc5lggwpUSbGHmNtHYxHnONWHt/jJaABRtVykiX94c=; b=S0F13JR6Ida3in
	C9JeW4/Vwt4cUtFjJ+TAwy8hZGwRIMnGm0qVhXUGcWYm7GDD1nYdmDh1WkSxUCHkx4jBcA0R10ang
	hZQcBZID5fllsFrV8rdJEStE3NaKPgB98GBhD2b/zidUstFXOJr5P6YJta9iJahQzFYR/SadFPAaH
	ghXjBEEbvHj4tmYYPyMChBULY/TRRkSw03EuCNqYiBEt0eVZC3sZDWAQq/7MIC1nx6S/juRd+yc3L
	skU5DXbAUzCtGMGkD/MDvRtkv2uRu5b+dKj2WG8yOwQX45LSPrEfKsdBZBzQmIdbRatoU+z2706Tq
	kC0qK/33wNSx7oPLel3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piGHl-007pyH-39;
	Fri, 31 Mar 2023 15:03:25 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piGHj-007pxm-26
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 15:03:24 +0000
Received: by mail-ed1-x52a.google.com with SMTP id w9so90804494edc.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680275000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=284uuIzp37htGE1Cyqz8zv6IM9mt+Q3/Rg8O/gIrt9s=;
        b=kDcj0QENY0JHJFz1J18pgkJaE5w20/yoGjYa33AR1u2XPinZBZ0wh9C/ZyhP+xsBTP
         DZ4J3pZJjcc6D9RSQceKpNb0EsGYDoY+mNC1yMi6RWsjxF1sC6byOJd1hgd+MlX3QiXq
         ZFKWwy0O7J9J/VWWw/FiRluHx0nC0daGAEOOkJDqdBlJejH6Qz6L8thgy8vqSHFuXF0G
         Q0iLr4LCJ+2xRK+1dE59W93TX88RuTdwp9uAOssj5a6ZVET5gDVbLnYLf9VTH3prqL7R
         NRsnXbqvbsaXTsMOUXWAY6bhdg3pMXCEdfdWGKwkUIio+Ibrt3EAm7N8pNwx/aru4yZ6
         p83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680275000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=284uuIzp37htGE1Cyqz8zv6IM9mt+Q3/Rg8O/gIrt9s=;
        b=zynwghdtt5QdmF5hjXENaFpPP+w0ggV5yG5qLzLL7nsD1KnaHZP/5hw/hUPdVKdJI0
         UDA9qdxv37IQULXr0GzHhPAPHFuhFtZsJS0tHyqAThQ/ZcCZRZV/6a2oZxuZYUb8kKw1
         y4Q24IM8uWsHVxQARahyk6cmAGkIXcUBE2wpOe9TWxnBRGDfAGqMvqEQTKSt8SvF/ern
         iwni1J1cqDtdc6dm5QsPCc0EWuQVMMqkzfArVJJnbEmQ76TzRVwZYyhlozhrKOa1UfkQ
         12t0hz6Pt+3wkrh7uaSrljyoG3/4aIHjSUks+OJAFE60hse8ORnOjRFHhEvoPpR4Nxiu
         1A2Q==
X-Gm-Message-State: AAQBX9fF+EW69ngchQcpc5edm752S3dDjojyiAF/dSjxCIPVnwv/1O19
	w7VMEcZX0sTKRyGvAKh6IsQUn2YkoMfIIwKDEcw=
X-Google-Smtp-Source: AKy350bA4ih4UrkiZ292pYQQOog5OLP5WG08x6Y2AxFx/7ljqZhCejYmJPlclzs70qhXxs6FLLgP3ulsBZif3Biklvc=
X-Received: by 2002:a17:907:7b8a:b0:931:6e39:3d0b with SMTP id
 ne10-20020a1709077b8a00b009316e393d0bmr14114905ejc.15.1680274999562; Fri, 31
 Mar 2023 08:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230307202257.1762151-1-conor@kernel.org> <d7c3ec51-8493-444a-bdec-2a30b0a15bdc@spud>
 <09cdec20-c3c8-4eb1-9a74-87f429543d3c@spud>
In-Reply-To: <09cdec20-c3c8-4eb1-9a74-87f429543d3c@spud>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 31 Mar 2023 10:03:08 -0500
Message-ID: <CABb+yY0ocpdB5RWyxncM7VJzJde6G-WscTKbT2=GMt3uJAccVA@mail.gmail.com>
Subject: Re: mailbox,soc: mpfs: add support for fallible services (was [PATCH
 v3 0/8] Hey Jassi, all,)
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_080323_698207_1B96E03D 
X-CRM114-Status: GOOD (  13.65  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgMTE6MTXigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGV5IEphc3NpLAo+Cj4gT24gVHVlLCBNYXIgMDcsIDIwMjMg
YXQgMDg6MzA6MzFQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gVHVlLCBNYXIg
MDcsIDIwMjMgYXQgMDg6MjI6NTBQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBG
cm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4KPiA+IEkg
Ym90Y2hlZCAkc3ViamVjdCwgSSBibGFtZSBjb3B5IHBhc3RpbmcgdGhlIGJyYW5jaC1kZXNjcmlw
dGlvbiBmcm9tCj4gPiBsb3JlIGFuZCBub3QgZG91YmxlIGNoZWNraW5nIHRoZSBvdXRwdXQgb2Yg
LS1jb3Zlci1mcm9tLWRlc2NyaXB0aW9uPWF1dG8KPiA+Cj4gPiBUaGlzIHNob3VsZCBiZSBhIG1v
cmUgc3VpdGFibGUgb25lLi4uIC9zaWdoCj4KPiBSZXBseWluZyB0byB0aGUgb25lIHdpdGggYSBy
ZWFzb25hYmxlICRzdWJqZWN0Li4uIEFyZSB5b3Ugb2theSB3aXRoIHRoaXMKPiByZXZpc2VkIHZl
cnNpb24gb2YgdGhlIHNlcmllcyAoeW91IHdlcmUgaGFwcHkgd2l0aCBtb3N0IG9mIHRoZSB2MiBJ
SVJDKSwKPiBhbmQgaWYgeW91IGFyZSwgd291bGQgeW91IGJlIG9rYXkgd2l0aCBtZSB0YWtpbmcg
dGhlIGxvdCB2aWEgdGhlIHNvYwo+IHRyZWUgYXMgSSBoYXZlIHNvbWUgb3RoZXIgYml0cyB0aGF0
IGRlcGVuZCBvbiB0aGUgY2hhbmdlcyBoZXJlPwo+CkkgYW0gb2theS4gQWNrZWQtYnk6IEphc3Np
IEJyYXIgPGphc3dpbmRlci5zaW5naEBsaW5hcm8ub3JnPgoKY2hlZXJzLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
