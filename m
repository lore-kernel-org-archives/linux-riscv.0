Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04585CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 07:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Guhl7ObZ9R2YmS+194HPJ6F/L2M7NuRBRFWZ++OTzgA=; b=22AqmMBz/zPu5w
	P9i6uegh/IsrZLVo6fUSSblCtFR4Vl4anJgfnPEojFgQM/tsG+cmJadJGZYkhUcnqJ+KRtAoj5zM8
	Qh6/3cTp2zxMzuzGr3n0EPZ+Qf8m7e9q2j3nfOfEczvqGBueEc/FjveytjviwGbVrFHAibaMfXVJI
	zPWYPYLBM4SvbJ0Sw97pKdG3m0YtIrS0lyOrKBLg1v8Ufrz5hOCFb0olwO/Qj4ukdaLtsTenvzhvh
	VxbRcfvexYR4NnXKP9KGIe2mhdXGr0I40OyAJp3ugDwn9U19OkItd5GqmdVYf6EJJ5noYtW0i0ASV
	YdGED71jZwmamgcqftLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrCJ8-000000079v7-1yHY;
	Mon, 01 Apr 2024 07:42:18 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrCJ3-000000079uf-3FMr
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 07:42:16 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2d687da75c4so37057651fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 00:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711957330; x=1712562130; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SSJljyfKnuJeOjPki7PuFiCXRujcBFkC7jlbcW3GDA=;
        b=V4G842t9b3OTxfc9jcl/lhF8Yfx9V19LlsxLhHAAGydl6IcSUp88j0wA3qfyQ1YuC/
         VE3X3pNgE3PcEz6RWC6Ob1bUUGCmmn2VFSDhfazexP2n6S3xUHZ2U2KwKtMEizShrP78
         DQ3VD9XTiXdd0Qo0lhW4uVGcByQTfNDIPCcWsteTTl/hA6TqRQgcTS9NH5ozmkSYihb3
         AVN83nNNC/2sEwA5TO7o8D3HEQfDutfOwWr6wxjRVinZRvh11uOeMoXmGEChh1ihYFEf
         lmWJ0eznMqxp1fHRC6T3OjDkDfvBKr/HXi2w1TJLuLdiOpw2wzwQ/Acpp6xf/MhJiIMn
         wLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711957330; x=1712562130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SSJljyfKnuJeOjPki7PuFiCXRujcBFkC7jlbcW3GDA=;
        b=uRU2YKwD3bzEgYiitCdkTrHgTsjTJXNbdEJmox5kxUB+RLpE7JPiq3eJGF4nVa1OUd
         JvDCkxAYbHUB2oGAks/lp6ubchuUjohTGdQVUUSq/Cpdaj6UOwezBPEt5RpvCSLH/luf
         NGGmGU0w/WCKWmIb9/L44cM4xeL2qT1+w+I6DrbzmPjYx0NnbN2MOOtLeL8Ny/ba4wqX
         2FQPpdABY+LS6j27UE0yDQzg8GGjqWkEKED3kiuOhxQxi/PvPA8n8+mvEQuwJePLC+A3
         JztHrO+EMhBl3imsDcnccqLnJD/0/8ZSGXP1GXVQHnbrkMbLaJKMJOLG+M6rTk/ILFgZ
         GPOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0O/lYVqIREicbe3uR7K4tWR35AlbBm18+sfx/2y0DjkfPd86o8cnECr2EgnyJ3o8/vf2TAH2a4yF1Lkxbyi4JeEc2LPxUBiSDr2d2h4f
X-Gm-Message-State: AOJu0Yy0WbVX14NugFUdVqqUExJYQB95QJUQsENhaD+RteeUo23uxwdj
	Tc3EybZMnwbb+yi3ZMfqwC/PNdLv1VAKPMVEzx86ayVEcqbloxX4UHLQtGjJSj5wgX1WJiy4b9c
	OwwuSaDBwihsoOicSdWx9RqVL7s8=
X-Google-Smtp-Source: AGHT+IHCeA3ZB/fyrTz8pMLnWGInr5YcrgiR+a/NUwxJXCLgasVcZNlOpzcH0Q5xA1D7XlYsXG2Jk7k5azBlx/fUck4=
X-Received: by 2002:a2e:a455:0:b0:2d6:f5db:4d6e with SMTP id
 v21-20020a2ea455000000b002d6f5db4d6emr4780215ljn.40.1711957329905; Mon, 01
 Apr 2024 00:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1709780590.git.haibo1.xu@intel.com> <7ca110c59cbb2fb358304a9ba4f9c7cbeb191345.1709780590.git.haibo1.xu@intel.com>
 <Zgpc/qW/as+gbb+I@sunil-laptop>
In-Reply-To: <Zgpc/qW/as+gbb+I@sunil-laptop>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 1 Apr 2024 15:41:58 +0800
Message-ID: <CAJve8o=s-hN28hXPB30oJB0cAoDAEPUbTYNh3V0Nzd-2DoT4vQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ACPI: RISCV: Add NUMA support based on SRAT and SLIT
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Baoquan He <bhe@redhat.com>, Sami Tolvanen <samitolvanen@google.com>, Zong Li <zong.li@sifive.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen Jiahao <chenjiahao16@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, James Morse <james.morse@arm.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Evan Green <evan@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <apatel@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, Yuntao Wang <ytcoode@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_004213_861089_E76D890D 
X-CRM114-Status: GOOD (  15.90  )
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

T24gTW9uLCBBcHIgMSwgMjAyNCBhdCAzOjA24oCvUE0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXIgMDcsIDIwMjQgYXQgMDQ6NDc6NTRQ
TSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBBZGQgYWNwaV9udW1hLmMgZmlsZSB0byBlbmFi
bGUgcGFyc2UgTlVNQSBpbmZvcm1hdGlvbiBmcm9tCj4gPiBBQ1BJIFNSQVQgYW5kIFNMSVQgdGFi
bGVzLiBTUkFUIHRhYmxlIHByb3ZpZGUgQ1BVcyhIYXJ0KSBhbmQKPiA+IG1lbW9yeSBub2RlcyB0
byBwcm94aW1pdHkgZG9tYWluIG1hcHBpbmcsIHdoaWxlIFNMSVQgdGFibGUKPiA+IHByb3ZpZGUg
dGhlIGRpc3RhbmNlIG1ldHJpY3MgYmV0d2VlbiBwcm94aW1pdHkgZG9tYWlucy4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiA+IC0tLQo+ID4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oIHwgIDE1ICsrKy0KPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9NYWtlZmlsZSAgICB8ICAgMSArCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5j
ICAgICAgfCAgIDUgLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9hY3BpX251bWEuYyB8IDEzMSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwv
c2V0dXAuYyAgICAgfCAgIDQgKy0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgICB8
ICAgMiAtCj4gPiAgaW5jbHVkZS9saW51eC9hY3BpLmggICAgICAgICAgfCAgIDYgKysKPiA+ICA3
IGZpbGVzIGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCj4gPiAg
I2lmbmRlZiBQSFlTX0NQVUlEX0lOVkFMSUQKPiA+ICB0eXBlZGVmIHUzMiBwaHlzX2NwdWlkX3Q7
Cj4gPiAgI2RlZmluZSBQSFlTX0NQVUlEX0lOVkFMSUQgKHBoeXNfY3B1aWRfdCkoLTEpCj4gPiAt
LQo+IFRoaXMgaXMgYSBsYXJnZSBwYXRjaCBzcGFubmluZyBhY3Jvc3MgbXVsdGlwbGUgZmlsZXMu
IENhbiB3ZSBzcGxpdCB0aGlzCj4gaW50byBtdWx0aXBsZSBzbWFsbGVyIHBhdGNoZXM/IENoYW5n
ZXMgbG9vayBmaW5lIHRvIG1lIHRob3VnaC4KPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IQpJIHdp
bGwgdHJ5IHRvIGJyZWFrIHRoZW0gaW4gdjMuCgo+IFJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1
bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
