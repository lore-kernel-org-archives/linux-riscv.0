Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489E8C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 23:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wgocfkMR1JDktD7v16OxNQhIcOVIMqoUDrcV+4Vadw=; b=nCBxiISnMNaa2t
	dM8J0p/6fV7biMCEKGNjGt2xYj+lJC4oRZMhQeFvrEpai5cxaLvDB7o4I/Xr6zGob8lzMojZsZtkP
	1ir3KCU+/TYmDkUZLG77bGOGTxFOt8OlyMlCp0rp2dPkyPk3y1wfioFupq3VnEX5I+R/B+/rKnUUW
	txMTo/vDWMRgQ1vH5AD4IquqZiNjZePbMc365/UiHM3+qq/bcVrT3RYZk8Q43PgckYglgnJlpV3Xa
	YabCfUk14nYIm0J8ysun9sa8C8GGkIItwJI9EnNXejxNap9E9r6dlKm/O0UNh9ICSzmUiogQ723Pb
	qci13VWbxk4IVaD5FFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAgvr-00DO1v-1X; Thu, 20 Jan 2022 23:33:31 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAgvo-00DO12-8v
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 23:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642721608; x=1674257608;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bbAUjyI63AzHMI4JG4Nlo6/VnP4NtE6QUmV9m2+5F70=;
 b=SJ9ktjHBzI8rd4qlJ+b3FJvWNsheitWeL66v0MDbRyZUD0L/kc/GjBpc
 TsJbGVXesvdhq8z78vGWpxykAiUUKhiKG9rI0bYnZXSTkgghSBkluuLOm
 f8h6emAZF6aXshR4AGCbVPNlSF+cu4Vgyu56xgOtKpsbwdAkZyLL2xD6A
 4N/7/LYaxyI5Y36efthfI/BykjW1ZiixmnxlOzrVAJlYljXFXz+fQPPeE
 fiRgAiJNcFLQju5KJPChI35OyHdyL/bE911Nl+eLHH4ODjuhvx6XqiO2T
 TjAI69Rx48LBFZbrI2oG1deA60Fou7gyYW/oz/ncX7+Ye20lG+5C585Oo Q==;
X-IronPort-AV: E=Sophos;i="5.88,303,1635177600"; d="scan'208";a="295059821"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 07:33:27 +0800
IronPort-SDR: Fua+9Fj1xrvw3xCe1ihB7i3w17frRBtikyeC73vjzCD3JTnKWAUCSXgH1+2r0f/Ke4yx4tp3/X
 i44UItf2jiu/JPs/Be46vjqhW3/bDssnkGjldjl3kg3IJvM0hc8VAMsMcn/BcomvUsFBCOCfKI
 yaqESLQXWsINEd/bgxm6rqc5V8Pzqj0eFbadyIVETWy+ew2NSKKmGrVGYu2el6tyuGLbzsl2jj
 iI44Uf5/axa3wlloeb+OqOMzOURmD/BvKJqFi8Eigy2vT/mGkMpi697R7y40SqotTyDyB8KAGz
 GpA5G2L13ITor7+TU5RsLFol
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:05:39 -0800
IronPort-SDR: wpBGH8wfPGQA46WxWkhcO5jR3EGCqzp3MM8EBPsba/qTCyOjWALJWwV9SyUxzfA956wyxgScGb
 TwzeqIMLEEbX+Qui/uXKVD4d4iUdNrF5bEjgX/I0NS0JXhBSMVgwePK2T52dBwRe+S4HHIQKi2
 aOZ0qw9dChvEuP7lib6DJPRerpV6tlWiMAtJMhRK95uXBZaWe4phe+4auaWXNJ7WS0G29YYfn/
 0dUjVPVVkLuOrMBlPjQ3ZLvfY+/oi1eY/CYiExoYK7xqWB9ubP7UmWQlrkR4tUxUDmFb1Sibvw
 h94=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:33:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JfzN66Mn3z1SVp4
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 15:33:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1642721606; x=1645313607; bh=bbAUjyI63AzHMI4JG4Nlo6/VnP4NtE6QUmV
 9m2+5F70=; b=nPviF7k6mge+zxBJQfoIVNdjwRcrV5QQ2EKWfvFapPCqzIiebTj
 D557Kwc0oLfiRItFOqHSP4Zkk7/qCv1CvQTNWI1IYa3djUfR7iYKe2Nkq0FOjg34
 UwZGYimrU5cnman+Y/6aNNVPiJYJ9AwN3hfGqdclwlIiV4r3uh4aRWAmai/7gFRL
 xrUYgC6HtPp9A5e/Ea/vLzdvzuhZ6hRg/maJm4hZxXM9aImrBFZFgXcsDWm276vc
 /b/K5e7dONGxO1zKn+DEMeQ8zyu+X4AhnG7lzQ/Ni2nLQuBiAKvIcQMGxlPsNnlg
 ehZDMSSHj3bGFwrUBohBrWaDKYIkEIDWuxA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 264IN_l278RA for <linux-riscv@lists.infradead.org>;
 Thu, 20 Jan 2022 15:33:26 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JfzN440YFz1RvlN;
 Thu, 20 Jan 2022 15:33:24 -0800 (PST)
Message-ID: <b030d405-b687-581c-1694-a26da6c3a78a@opensource.wdc.com>
Date: Fri, 21 Jan 2022 08:33:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 12/12] RISC-V: defconfigs: Remove redundant K210 DT source
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, anup@brainfault.org,
 heinrich.schuchardt@canonical.com, Atish Patra <atishp@rivosinc.com>,
 bin.meng@windriver.com, sagar.kadam@sifive.com, axboe@kernel.dk,
 linux-kernel@vger.kernel.org
References: <mhng-f042ecd2-dc39-4212-a2c6-3ea842c20e3c@palmer-ri-x1c9>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <mhng-f042ecd2-dc39-4212-a2c6-3ea842c20e3c@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_153328_413479_DE5DD51A 
X-CRM114-Status: GOOD (  13.29  )
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

On 2022/01/21 3:19, Palmer Dabbelt wrote:
> On Thu, 06 Jan 2022 18:14:00 PST (-0800), Damien.LeMoal@wdc.com wrote:
> 
> I just see an empty message here.  Not sure if it's something wrong with 
> my mail client, it's always a bit confused by yours -- it's usually not 
> this confused, but it is generally a broken mess so I wouldn't be 
> surprised by anything ;)

Sorry about that. I have some problems with my Thunderbird+Exquilla plugin on
the corporate MS Exchange account. Email replies are all sent empty since a
couple of weeks ago... Not sure what is going on but that is definitely on my
end. Switching gradually to this new email address (not MS Exchange :))

In this reply, I was simply saying "OK. Thanks !"

Cheers.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
