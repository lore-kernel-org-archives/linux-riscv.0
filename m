Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6ECC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 23:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amg3yJDtdOU9BtQB8eISansRNkYQFuvjP6UMmm8/gnw=; b=qg4VIPC9eDC9Ss
	RLgacCB4Gv/FMcfPgC1wdZNx2a1/dSKabdtQAvgKwNQvqjFw84McyYivJPFv9th1SjtaQdgqGlaYr
	+2tZtb2HLsdaDA70ANBOoC7ctsPCjSXJQNQSc4CF84YWzKj1PAGZplAP1rAklq9PWcm/Izd4gW6gP
	57gwWA4gVpjKI7vCEXXp61kfN/+VcUxqSv8+Ib41nklcsm0O0N4vYc2V6EXJvooSAkiQuhUy9vEo8
	cDk29xnQFPuzs+IuMSdpIyj5QOyAdL91PaBKWottKgTO6oTabMVS5lFlMne8mGNXn2W4c03ETibNZ
	+b/vRwSk13zj9WTNBGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf96F-007pa6-Mv; Thu, 14 Apr 2022 23:42:07 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf96C-007pYt-55
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 23:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649979719; x=1681515719;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=octI8gkuUdPp2CcD7y3vKEWC/6kqL3X5ZcA2TURCbbY=;
 b=ddRWRaAoo0ksCZ6Xt79uQcQ0WEcoNVnqnobXNC1LXUh4xjMIfc+njMDZ
 ze3/2tLPK1LUStjNbyeD8k6w8eQd9gG/joCQJZLwp8dpehEwtgmumFcS1
 cuyX5RpyJMayK2QpOoQ/7aMgUQK5bCjaeh4JiG2mYA8jNEHW0bozzmzvO
 QCkIGs6lVcBS+o5mJXjreLYEptpgzTTtKT+nybMSVZj2/mFfg91w6zlf8
 reRZtubyHBf2XQqcRYMbm/e5a25aTaMOi64L1lJJRzkR7ZKtQGiVTcz65
 9PuRAWKAy77alIGqeGMrfCWFwrsaKS/bVVt4XUw3BzlJ9j7sVu5ASwPgY w==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; d="scan'208";a="197953741"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 07:41:57 +0800
IronPort-SDR: 1l/e2g7aSei5o4lMi7mdyER1+w5cc3hlow8CupYVh1xzIyv58XgTr1rfDCNH/6p3qYf2EVDY1M
 41K52lMJYEkaaNdQyvQbBPObAoASlaOLoFcLoNZNYyUnuKpaDUvyIEiofR2rutX4MN1QrFlDVq
 wDn02mXiGB6sfBzOnbbrFN6FTgyDBjIfbkbaS7W7u/4iT9SMJACrus0J3K2hw5C8RFPy5yDrC2
 qaQugp595F6yIhmg74ZR94zfgqVHL8g4+9vuaFXTRMvo/9mSISfGaVXHxcOCjiesDmktcMibt8
 9SjtceAte5jmVEhswG3zrOUr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 16:13:13 -0700
IronPort-SDR: pxZZl0h9GS3PzshlCiEkZxcchpN+BlRMmHF+0MbNJv+q10ru43cygVoutZlRxu/2w2zrLrCtst
 M5vgAjL7j+TaV2i5sSpz/IMdqApYviSYSNRq8qxoVNfkEQqsfVCOhlSo8vHOEuIwGi5mci8FYd
 fxiEPnAOI7REjNnmrdIa/pzFyP3jsm2WisxIbFGs/VNSitY2U6HrUckVH/PDp0thvta7NGr2yC
 O4MScGrsbv3CWQurjNbq8IWEBdJ8WGzeGm9hGsyVBQQYWBIzmZexTDQw8Y3e82Zwap987ehzbi
 wwM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 16:42:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KfbbF02qsz1SVp4
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 16:42:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1649979720; x=1652571721; bh=octI8gkuUdPp2CcD7y3vKEWC/6kqL3X5ZcA
 2TURCbbY=; b=G8u3sp4M11CSasP2r1AQLolHkzCU61yyv5FwdwwXq4CypIYTAnH
 hGyML2VTo37SlnJ9Mgk5XyJhd01IXY5KeJdsnBN8iKFe3L71ueTUYRYA1dKm/Q3h
 OeieM9OwF+JDY+JUsMXV7vBYzylsEK9jEj5n//hIieuSziiWR7dUOgd1xX6WlwZD
 miasY8fSj3Q7K7nemKO99tJ3LrlcOpZK3FpOM6uBS7pT6Ly3pq4NCCFEggimhqFg
 1oOm7TyQJrpQ8icbEc176i79M8XmZw+lTmLadQG9q9348w3MXGxYfLM4MSQ94Zv8
 NsVkd07JhCSjOYZN5yR6fQdvhg/eLTFYX+A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id kggXWNXGb-4U for <linux-riscv@lists.infradead.org>;
 Thu, 14 Apr 2022 16:42:00 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KfbbB0qm4z1Rvlx;
 Thu, 14 Apr 2022 16:41:57 -0700 (PDT)
Message-ID: <04a0c48d-e81f-264a-b467-4a5b3ffc4f9c@opensource.wdc.com>
Date: Fri, 15 Apr 2022 08:41:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Niklas Cassel <niklas.cassel@wdc.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger <vapier@gentoo.org>,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <202204141624.6689D6B@keescook>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <202204141624.6689D6B@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_164204_311776_3B81A917 
X-CRM114-Status: GOOD (  13.56  )
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

T24gNC8xNS8yMiAwODoyNywgS2VlcyBDb29rIHdyb3RlOgo+IE9uIFRodSwgQXByIDE0LCAyMDIy
IGF0IDExOjEwOjE4QU0gKzAyMDAsIE5pa2xhcyBDYXNzZWwgd3JvdGU6Cj4+IGJGTFQgYmluYXJp
ZXMgYXJlIHVzdWFsbHkgY3JlYXRlZCB1c2luZyBlbGYyZmx0Lgo+PiBbLi4uXQo+IAo+IEhtLCBz
b21ldGhpbmcgaW4gdGhlIGNoYWluIGJyb2tlIERLSU0sIGJ1dCBJIGNhbid0IHNlZSB3aGF0Ogo+
IAo+ICAg4pyXIFtQQVRDSCB2Ml0gYmluZm10X2ZsYXQ6IGRvIG5vdCBzdG9wIHJlbG9jYXRpbmcg
R09UIGVudHJpZXMgcHJlbWF0dXJlbHkgb24gcmlzY3YKPiAgICAg4pyXIEJBRFNJRzogREtJTS93
ZGMuY29tCgpIdS4uLiBXREMgZW1haWxzIGFyZSBub3Qgc3BhbXMgOikKTm8gY2x1ZSB3aGF0IGlz
IGdvaW5nIG9uIGhlcmUuIEkgY2FuIGNoZWNrIHdpdGggb3VyIElUIGlmIHRoZXkgY2hhbmdlZApz
b21ldGhpbmcgdGhvdWdoLgoKPiAKPiBLb25zdGFudGluLCBkbyB5b3UgaGF2ZSBhIHByb2Nlc3Mg
Zm9yIGRlYnVnZ2luZyB0aGVzZT8gSSBkb24ndCBzZWUgdGhlCj4gIm5vcm1hbCIgc3R1ZmYgdGhh
dCBicmVha3MgREtJTSAoaS5lLiBhIHRyYWlsaW5nIG1haWxpbmcgbGlzdCBmb290ZXIsIGV0YykK
PiAKCgotLSAKRGFtaWVuIExlIE1vYWwKV2VzdGVybiBEaWdpdGFsIFJlc2VhcmNoCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
