Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FE6C25B75
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mI4uYLxG5oG8MD5Ljlmny3oEa+OoCWTdQg1+uPnqQoA=; b=IXGP1RYTBitSc2
	BHczrnF9kYllJeRuk8SNiZ7gKSzTsmMhflgze8Qqab1jb2njTKVnIjpFa/119xACngoCc1rYCxzBi
	OnmK7Sv7Wirt2YZ+1WLBhKtc4y7OmjY5FjarnUPIg4z4QkABSS46OxCmdFxXXbjYSboaZ6FN1MggO
	hk9IZzGbz+UcrvQk6jv/zYpGh9qLUaoNelLT26q2L4aToJk95eUKkGSnNRaR00oyMn3aNu7zEcrBx
	k6dC4HKr6TBvecafhC3vHVy70HJG3cIy733exKnIkb3afMgDno3FWMr5Sm/ironVYQ7fveOHlKKoI
	l8cW5KLVBCArMu6RwE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF71D-00000008amj-42ui;
	Thu, 06 Jun 2024 06:54:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF71B-00000008amE-09tk
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 06:54:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-35e4d6f7c5cso654910f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 23:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717656875; x=1718261675; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a7TCmXGWr94ZoD3g1UVXKN5ISjES07LkwWyEhWG4/I0=;
        b=a39VagmdgkKRw6iczqpUh/StP2ZYGEBsDCNkO0ECYdhsdvhzIrokYSuCmezmiS/bdU
         eivd2ySJ8hF1tUp9ynpmeeEZ3V67fdYdSpEnoWXO6A4+fA5nRzsSUnXQtQuR7/wUfdlP
         lRhuqh1+/wPcmJR+im3oRwJSEVaikglpsXdPURt6Ialme8fIFkEmES8VFD/8Xg1dQz1x
         stChEgOZ1l1afy1wjXQplPL9uqs45bJTS5KNLLIPJXxgbbsBWzb1zD23tLyFzF1tPoHH
         ReARiVebK4gd4L4wK5iDQMuqp1AhStZ/d4y03xsx09cj7BUzT5Fn+p9HXKLvs6/H2SZ5
         Njeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717656875; x=1718261675;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7TCmXGWr94ZoD3g1UVXKN5ISjES07LkwWyEhWG4/I0=;
        b=Vllrof/aqmC+GFRuXwIsdDVlgXgowZ+9yJ11IENhr1B7duh0yIDR7jWQ8DQEqDD8B9
         x8aa2rtq0XCK25xDqQ8wK8es2sosVnoTjixTvdPKpRQHwG3jnZtAV36X/OKFky8oow4g
         /HpMtIq2G5XIGXbwe+EbnPU5HP7kiSRsK0bVjAlTfA9Af0bKSuWYQSuXqwmBdlIOZ7tm
         zGwlciYULyC1sQFzScUCf7RgKhewgu73ogzEUizSycRVS8Ny7Sdf85/HhSY2V2h4HBHw
         S2JGBSgA8w/WK9SrSOtQs/WnYbBVFbcCKg9C3+4HM8zgbcKDKrDKZt2803kaT9gd3XAx
         +SzA==
X-Forwarded-Encrypted: i=1; AJvYcCVo+JHiDgW9DXnxDmkNH+jptJ1w/8KO+lrKxTPHpiAiwnCqQbQAsL1Y2COXrDZ7UngOay6Cc5OFqN0Nb77OVKZLtQo9DhDZ3MHAF1wbPYAC
X-Gm-Message-State: AOJu0YwhGNt6IixAxwk9x7AieqByl+81aMyP9GBoI6HC4zVKphJP+vM2
	lTt4VS8AAgZJ/brX4vwwdxynIrvFlAOPQXrj2lsl2IwGi/v9F9Kqo/+H1FXHyoepItid5sCXShi
	M
X-Google-Smtp-Source: AGHT+IHNKnXIBb3qZJygU2iYDImkZ9rzUJkNBWDBUa1dYfWFLGg6a9Ze5BMW5kuAh9PHrPhk9uqCHQ==
X-Received: by 2002:a5d:4711:0:b0:35e:83f3:ea0a with SMTP id ffacd0b85a97d-35e8ef65b69mr3594626f8f.48.1717656874844;
        Wed, 05 Jun 2024 23:54:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5fc1ca8sm714821f8f.97.2024.06.05.23.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 23:54:34 -0700 (PDT)
Date: Thu, 6 Jun 2024 08:54:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v6 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
Message-ID: <20240606-988b5519747e28c276f9a952@orel>
References: <cover.1716578450.git.tjeznach@rivosinc.com>
 <7dcd9a154625704cbf9adc4b4ac07ca0b9753b31.1716578450.git.tjeznach@rivosinc.com>
 <20240529-08fd52a8e703418142bdfa84@orel>
 <CAH2o1u7N03b3dzxxG8jp7qW2jmCDADwq_OL2Ayv1AL1XsA7s5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u7N03b3dzxxG8jp7qW2jmCDADwq_OL2Ayv1AL1XsA7s5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_235437_101380_B175D2E2 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMDUsIDIwMjQgYXQgMTE6NTg6MjhBTSBHTVQsIFRvbWFzeiBKZXpuYWNoIHdy
b3RlOgo+IE9uIFdlZCwgTWF5IDI5LCAyMDI0IGF0IDg6MTXigK9BTSBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKLi4uCj4gPiA+ICsvKiAzLjEuMyBJL08gTU1V
IERpcmVjdG9yeSBjYWNoZSBpbnZhbGlkYXRpb24gKi8KPiA+ID4gKy8qIEZpZWxkcyBvbiBkd29y
ZDAgKi8KPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSU9NTVVfQ01EX0lPRElSX09QQ09ERSAgICAgICAg
IDMKPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSU9NTVVfQ01EX0lPRElSX0ZVTkNfSU5WQUxfRERUIDAK
PiA+ID4gKyNkZWZpbmUgUklTQ1ZfSU9NTVVfQ01EX0lPRElSX0ZVTkNfSU5WQUxfUERUIDEKPiA+
ID4gKyNkZWZpbmUgUklTQ1ZfSU9NTVVfQ01EX0lPRElSX1BJRCAgICAgICAgICAgIEdFTk1BU0tf
VUxMKDMxLCAxMikKPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSU9NTVVfQ01EX0lPRElSX0RWICAgICAg
ICAgICAgIEJJVF9VTEwoMzMpCj4gPiA+ICsjZGVmaW5lIFJJU0NWX0lPTU1VX0NNRF9JT0RJUl9E
SUQgICAgICAgICAgICBHRU5NQVNLX1VMTCg2MywgNDApCj4gPgo+ID4gUklTQ1ZfSU9NTVVfQ01E
X0lPVERJUl8qIGZvciBhbGwgYWJvdmUKPiA+Cj4gCj4gSSd2ZSBjaGVja2VkIGxhdGVzdCBSSVND
LVYgSU9NTVUgQXJjaCBTcGVjaWZpY2F0aW9uIGFuZCBpdCBsb29rcyB0aGVyZQo+IGl0IGlzIGEg
Yml0IGluY29uc2lzdGVudCBpbiBJT0RJUiBuYW1pbmcuICBUaGUgYWNyb255bSBJT1RESVIgaXMg
dXNlZAo+IG9ubHkgb25jZSwgd2hpbGUgYWxsIG90aGVyIHJlZmVyZW5jZXMgdG8gZGlyZWN0b3J5
IGNhY2hlIGludmFsaWRhdGlvbgo+IGNvbW1hbmQgdXNlIElPRElSLiAgSSdsbCBrZWVwIF9DTURf
SU9ESVJfIGhlcmUuCj4KCkluZGVlZC4gSSd2ZSBtYWRlIGEgY29tbWVudCBvbiB0aGUgc3BlYyBj
bGFyaWZpY2F0aW9ucyBQUiB0byBzdWdnZXN0IHRoZQpzL0lPVERJUi9JT0RJUi8gY2hhbmdlLgoK
VGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
