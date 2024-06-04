Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B90C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dTaDjp2BaXCxitvjOvAxZesGvYDpq6E+ChMPR9T+r4=; b=CvtJ2SNiPwO+P0
	3rG6T6trOabbusLw6ckeL7bE56vs+ip2TVqj/ozpp7iZrg1P1Dknhjl4L2IlX3PJmch6N2AUgfiBu
	XBjzPG3Lki9m3SrF5utyCDmtjZ400TGPS9xJBvSgpRdvjoFete41oQodz3rEpbdarXpwqd55cYp4x
	IDYlreonoqXVnOoux1F/Q7xW5an80BhqvRWPHdWfhA3kQeei3Rit5neFg2BttrZdQXBC5PhUIUAGZ
	NuQOjgqBW6dpKJgHeBOOkr4N/mXi3lFshPLokUNNt1Db4D74w1YDmOoT7qJYvtw8suqkXMoUAf4f9
	3dBgDBVt2v8pxGouOUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEQkU-00000001uqZ-4AC0;
	Tue, 04 Jun 2024 09:46:34 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEQkR-00000001uo7-3n7K
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 09:46:33 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2c1efa67244so587652a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717494386; x=1718099186; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4Iy/95Cu2HrlzBSr5TKl0e7xBU0QDGnX2eGXYKgDdg=;
        b=jAcaCHyOog3o8O2SXdtqTKlrVhE28DpL0hzXIOYEUAj3NyW69tn0aMO6HTAIZR5Dds
         RFp8/6QRClEP9nc2HpDkV60fw+U/LAl1jhnTbiY54OnslU30nYeU1okFihNBweA+K59G
         DTzIBwvD2S8GppDKBpKsy5ejwmHymJZ59EwyLici4ZjRgis0hh60EEuzX0/mvj6ZgnkG
         79bVawzpGF/AJd6GgUoN5iQlVOIOUcrWksGu5CdcVWp19PSEXcPXw/HEnCWoNqoKJGlw
         n5A5YnI9Zoac/dKSkt9z3Hnv/6QoTD6nG82XkRB8xZnPDRKCxSmityoWOQ2YSGAfrAoA
         IXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717494386; x=1718099186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4Iy/95Cu2HrlzBSr5TKl0e7xBU0QDGnX2eGXYKgDdg=;
        b=AkhdlnhnYOrA1SJt2eVNsGg8m+kF4McdZuwD0WLixhmaIKlSqX7yrfDvTFrLPZNrkE
         m0IgU/2RqOxK2tDf1dyqonZ9YjfV1Cmr7TSnwlrGPq6xzoXxH7tELhqq3pdDbHvLXwQi
         knJbWdSOzIZVcqRMMQhKxzVOP6K+UZ7606pAN8KrSlqjkH7hDABQ1SOdkcJVUjjWqMMv
         M4qdVw/rVsFMabvu6rHIG9FJL/PU7M3KR8tgCYRgStmT9/FJhR8h/piWZaBsrz2S2NRs
         oDN+XHxfSV4BfQh3ya8fxVwAiEwLyPJlXF1QaS8Slb6sxPAbsBSCQ3YaRQRHHa5IWSwu
         Vm6g==
X-Forwarded-Encrypted: i=1; AJvYcCWVo3es6mhNCCm/D2ZnW3RMme1NqKOhjNNDNdMhiZOAYHr4tEw3EzzzWO42qUNZwnhYvNvRFw6orHO23bIwfPCPq3os72FKWRN2mIfeMIBq
X-Gm-Message-State: AOJu0Yw783r8uPWUmr5P4cawCf0zJNyXOtLG3OsUTPj+6shXEI85Zvh0
	bnGyHbm8cApnwEA8JvDimCp0y5pz2ymPw/4I13C3B9/SmGXo97k3nHbW+6NWoEMaMDrjSQyLTYM
	JGpYzZNswIwojJYOfKGaL/Cc5E0M=
X-Google-Smtp-Source: AGHT+IGQu/cJn1x0sA5BtqSnIZFVL97WUuQok1tV3pUcfO+SZxiGMkxxQbIzQbdbfMNIlTn164Rr8DvSHK2haHzzUy4=
X-Received: by 2002:a17:90a:12c9:b0:2bf:9370:5a55 with SMTP id
 98e67ed59e1d1-2c1dc5be130mr10619514a91.2.1717494385767; Tue, 04 Jun 2024
 02:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com>
 <20240510-unfounded-syrup-d1263d57d05a@spud> <NTZPR01MB0956D48361098E8AA4B3930A9FE02@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <20240511-unbiased-dainty-ccb5ece9b1b9@spud> <NTZPR01MB0956A7393097129D3CD048EB9FE32@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <20240514-congenial-smother-1e4b0fc6a5df@spud> <NTZPR01MB0956CF1AA9EA5A20A174FD8A9FEC2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <20240515-reorder-even-8b9eebd91b45@spud>
In-Reply-To: <20240515-reorder-even-8b9eebd91b45@spud>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Tue, 4 Jun 2024 12:45:48 +0300
Message-ID: <CAEn-LTrKn079kbs2Wx5AuTs5+_sB4zaJsTf=MKn_nZZL04E5gA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add notifier for PLL0 clock and set it 1.5GHz on
To: Conor Dooley <conor@kernel.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_024631_969236_736E90C1 
X-CRM114-Status: GOOD (  20.39  )
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

T24gV2VkLCBNYXkgMTUsIDIwMjQgYXQgNzozMeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAxNSwgMjAyNCBhdCAwMjoyMzo0N0FNICsw
MDAwLCBYaW5neXUgV3Ugd3JvdGU6Cj4gPiBPbiAxNS8wNS8yMDI0IDAyOjA4LCBDb25vciBEb29s
ZXkgd3JvdGU6Cj4KPiA+ID4gVGhlcmUncyBhIHB1c2ggaW4gVS1Cb290IHRvIG1vdmUgZGV2aWNl
c3RyZWVzIHRvIHVzZSAiT0ZfVVBTVFJFQU0iLCB3aGljaAo+ID4gPiBtZWFucyBpbXBvcnRpbmcg
ZGV2aWNldHJlZXMgZGlyZWN0bHkgZnJvbSBMaW51eCBhbmQgdXNpbmcgdGhlbSBpbiBVLUJvb3Qu
IEkKPiA+ID4gZG9uJ3QgcmVhbGx5IHdhbnQgdG8gbWVyZ2UgYSBwYXRjaCB0aGF0IHdvdWxkIHBy
ZXNlbnQgVS1Cb290IHdpdGggYSBwcm9ibGVtIGlmCj4gPiA+IHRoZSBWaXNpb25GaXZlIDIgbW92
ZWQgdG8gdGhhdCBtb2RlbCB0aGVyZS4KPgo+ID4gV291bGQgaXQgYmUgYmV0dGVyICBpZiBJICBj
aGFuZ2UgdGhlIHJhdGVzIG9mIFBMTDAgYW5kIENQVSBjb3JlIGluIHRoZSBkcml2ZXIgbm90IGR0
cywKPiA+IGFuZCBhdm9pZCB0aGUgZHRzIG9mIExpbnV4IGFuZCBVLUJvb3QgYmVpbmcgZGlmZmVy
ZW50Pwo+Cj4gSSdkIGRlZmluaXRlbHkgcHJlZmVyIGlmIHdlIGRvbid0IGluY2x1ZGUgc3R1ZmYg
aW4gdGhlIGtlcm5lbCB0cmVlIHRoYXQKPiB3b3VsZCBjYXVzZSBwcm9ibGVtcyBmb3IgVS1Cb290
IGlmIGltcG9ydGVkIHRoZXJlLCB5ZWFoLgo+CgpXaGF0IGlzIHRoZSBjdXJyZW50IHN0YXRlIG9m
IHRoaXMgcGF0Y2hzZXQ/CgpJIG5vdGljZWQgdGhpcyBwYXRjaHNldCBvbiB0aGUgVS1Cb290IHNp
ZGUgZnJvbSBIYWwgRmVuZzoKW1BBVENIIHYxIDAvNF0gU3luYyBTdGFyRml2ZSBKSDcxMTAgY2xv
Y2sgYW5kIHJlc2V0IGR0LWJpbmRpbmdzIHdpdGggTGludXgKCkl0IHNlZW1zIHRvIGluZGljYXRl
IHRoYXQgdGhlcmUgaXMgV0lQIGZvciBPRl9VUFNUUkVBTSBzdXBwb3J0LgoKQ2hlZXJzLApkYXZp
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
