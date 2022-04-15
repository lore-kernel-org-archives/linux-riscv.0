Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9872DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 01:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qR5r6WHR46VkU/3Ni07ZzFEpLsT1/CMP7v32aX+3Ck=; b=owWCZyAu6Aoop/
	cAGDOHvE2R6prht2ptQJaVxSYb7RWu/3KYJggCSdQMkN1GvYkaIxjrGVDkB/VMCSMobrDNPeKnOhD
	voIWlpICUAPOutS1sT2TKSF2AFuJWqb55nw+lirpWCHXvDB2xH7dM3kU3KV+QbADLJS6FzwHTbV2+
	HMTNHFiTcFJmZZD2kLH33HTvDuOcdfJs7zk0ZWUemAY5dAVzFVd/GL3dxp75RdRfhK/rEOop3iHnh
	af9EoJV9JFjpDd6N1psZu6srzB0ALxtnua/WHpfwqeDsUFItKZwzwImHyRqOR8MrZIID4morxq098
	hmvT631wUKgng+oFlj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfAWw-007xhq-2l; Fri, 15 Apr 2022 01:13:46 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfAWs-007xfk-UQ
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 01:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649985222; x=1681521222;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2o3hbZhROctTrf9/YEdToCbep6cUQhIveDuZAWOBAjM=;
 b=HCWv8xiHZaG9My9oWJ4ON+UJyo+PjfmwBMuJqUPY2QgwiN5kEqtUJaex
 tWIjeMu4IHrPMQcfM0j6jW0yV6YCELPCgffft/56JAneNQ+IKcVWs14s+
 7yAwOq17NVwdrPDsy/4hn1eZeLyfJD29uXzL552kMQW8+Oy7KW5cZJM2I
 3P6YC6OGhCsXRg5Ze0ZfTEyajRv3yy9QKK7pZMgv+4nzK6WnvYRPar5qA
 x28JHz4tiRoUFDTX71bNQxbKqGyOe6xjUgUL9Q00DEE3qmiQAKAz/ooHb
 xIIPcXNVqNv/VES1Yh6XfLVArY2QzumHelZj5Je3/JqMIRmZtMGsabaFL Q==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; d="scan'208";a="302149921"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 09:13:36 +0800
IronPort-SDR: tpxWFlPxvnsJ62SxZ1k7dSr35e9xxgA7cbR/vihfnLJ1HGxN+8KaeTvSDtcZf5pTWTJjpY84tB
 0D1nHM94hg5Gf6+R6UzQScXtVHkqFlntlHgf15pX6Q/wpy6KUsuIdb8FIT+qlbg3Ac+D302Rf0
 MlJfCPgPbkvbkjQWtAPj0JvY3J/fJZmd8Azg1srKRV6PiBK3gsAyRz2UUDIUcGnq6p69jUer/E
 nyWmL97SFndyhDMGPZ9g4TCzeZxyQ5OGYFgPTBjGZA0dXojQHi81sfBeSgokqK/UyXvias4upx
 X6Bf3VGqn53lgUhDLFHpMUy9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 17:44:47 -0700
IronPort-SDR: tF/z7AFLcOzkrS/VxzyPotO3vPqC9Q5xkElMikW+J7M0dnKR1z+dal/rLDL3qankBhPtOx18pH
 DivE+6dEBtJV9Jj+gMqstZs37/MEwcq++VMb1aFn8zuuYaL17wBnJ0fIhm4DU3DbtycLBXwpfQ
 DM9AlSrXiPmFykK6QccO4j4sn32Jm88HT4kZRyYY3WX6ZumfX5eQlfpfZzaIToRXc2LE8Mjrtz
 +dWZ548cUvv/qUlJqjbG5+CmkG+jCV8pTmLKSDDUY/+2nEJyB/w0eWYK9H3NrcSFnffeqR7Tq/
 r0Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 18:13:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kfdcv3YDjz1SVp3
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 18:13:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1649985214; x=1652577215; bh=2o3hbZhROctTrf9/YEdToCbep6cUQhIveDu
 ZAWOBAjM=; b=mWJ7/209jF5f6cH7UXv/Nyw7kMvCcMKmosSacEyi84ORPLbeYJQ
 MtUB3jAAFeHPNpA8o+sWbphgyyUNQYB8OZ5diOrgk9B7KoXA2yecdJ4CPlqgi0zL
 X7gNmQToLzBFQR8a23dn9UnxA7nz1U3gm4qx6SZyK+2/dHZc0je0n5KbV/l9B2xH
 gK4Kfaqn7Nwu1VunDYoDJD7KwWLLKzn9IQqxk0vKWAbRtNdVl1uDlsiv/0jNo8cv
 xCYXVwG3tp64CBUPTC1Qyl37g2PHLfG3O0Xz5HzP+cChYa98sC49qe95xjj26W74
 5xSEMLfkgGl/VvMtJsCUkoM/fpFgWzarxOA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id e1wXUtYoh8E8 for <linux-riscv@lists.infradead.org>;
 Thu, 14 Apr 2022 18:13:34 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kfdcr4SBfz1Rvlx;
 Thu, 14 Apr 2022 18:13:32 -0700 (PDT)
Message-ID: <9a9a4dcf-0ea1-01ac-d599-16c10b547beb@opensource.wdc.com>
Date: Fri, 15 Apr 2022 10:13:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Content-Language: en-US
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger <vapier@gentoo.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
 <Yli8voX7hw3EZ7E/@x1-carbon>
 <6ee62ced-7a49-be56-442d-ba012782b8e2@opensource.wdc.com>
 <YljFiLqPHemB/u77@x1-carbon>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <YljFiLqPHemB/u77@x1-carbon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_181343_074207_40F84869 
X-CRM114-Status: GOOD (  20.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/15/22 10:08, Niklas Cassel wrote:
> On Fri, Apr 15, 2022 at 09:56:38AM +0900, Damien Le Moal wrote:
>> On 4/15/22 09:30, Niklas Cassel wrote:
>>> On Fri, Apr 15, 2022 at 08:51:27AM +0900, Damien Le Moal wrote:
>>>> On 4/14/22 18:10, Niklas Cassel wrote:
> 
> (snip)
> 
>> So if we are sure that we can just skip the first 16B/8B for riscv, I
>> would not bother checking the header content. But as mentioned, the
>> current code is fine too.
> 
> That was my point, I'm not sure that we can be sure that we can always
> skip it in the future. E.g. if the elf2flt linker script decides to swap
> the order of .got and .got.plt for some random reason in the future,
> we would skip data that really should have been relocated.

Good point. Your current patch is indeed better then. BUT that would also
mean that the skip header function needs to be called inside the loop
then, no ? If the section orders are reversed, we would still need to skip
that header in the middle of the relocation loop...

> 
> So I think that it is better to keep it, even if it is a bit verbose.
> 
> 
> Kind regards,
> Niklas


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
