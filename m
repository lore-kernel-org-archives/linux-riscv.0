Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E87C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 17:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkIlt32Z4LiAe/JJit3GLt7v8xYhWFTNJjzUd8hDzLc=; b=ZaYBF29OCOBpWh
	pOjsDzV5f6cdXL7zONAWVYtCTibYOcvv4QwDX7if1ggVbJHbzGsP57jc8/liezU1qdgDiGpETDzUN
	ASmqNFqYTkaLG9ITyJxoRVevcdrSPUjdKXJ7/iUPBWodMF1CrbkGwihwqU0gbiYOfR1btlg/lLUJZ
	6rwPFP8t+ItSW9tZjyPgBWPXrrn7zdWqJDFcdHYUp+TMiOYD/218mbE5AJEdEKnMvnTpqB34HA9il
	2H8q49xXPqMC4LtEukpDozaQbsxV/piJuLnpLAoHofbCC0iFofUDmOb1bxW/7ESc/aNeFem9YYSG1
	lACc2ilpjjKC3tbdmzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poomP-002t9s-1J;
	Tue, 18 Apr 2023 17:06:09 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poomM-002t7e-0B
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 17:06:07 +0000
Received: from [167.98.27.226] (helo=[10.35.4.205])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1poomD-000YcO-Um; Tue, 18 Apr 2023 18:05:58 +0100
Message-ID: <89499b40-c64e-3c0b-8ab6-ce84e94768d1@codethink.co.uk>
Date: Tue, 18 Apr 2023 18:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH kvmtool 2/2] riscv: add zicboz support
Content-Language: en-GB
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230418142241.1456070-1-ben.dooks@codethink.co.uk>
 <20230418142241.1456070-3-ben.dooks@codethink.co.uk>
 <ub3varg6spvwh5ihma4ossabuvbuvyxst63pra7rm2lfrkychf@4olgfsvgnij2>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <ub3varg6spvwh5ihma4ossabuvbuvyxst63pra7rm2lfrkychf@4olgfsvgnij2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_100606_090994_F8C72ABF 
X-CRM114-Status: GOOD (  20.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 18/04/2023 16:00, Andrew Jones wrote:
> On Tue, Apr 18, 2023 at 03:22:41PM +0100, Ben Dooks wrote:
>> Like ZICBOM, the ZICBOZ extension requires passing extra information to
>> the guest. Add the control to pass the information to the guest, get it
>> from the kvm ioctl and pass into the guest via the device-tree info.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   riscv/fdt.c                         | 11 +++++++++++
>>   riscv/include/asm/kvm.h             |  2 ++
>>   riscv/include/kvm/kvm-config-arch.h |  3 +++
>>   3 files changed, 16 insertions(+)
> 
> Hi Ben,
> 
> I have a patch almost identical to this one here
> 
> https://github.com/jones-drew/kvmtool/commit/f44010451e023b204bb1ef9767de20e0f20aca1c
> 
> The differences are that I don't add the header changes in this patch
> (as they'll come with a proper header update after Linux patches get
> merged), and I forgot to add the disable-zicboz, which you have.
> 
> I was planning on posting after the Linux patches get merged so
> I could do the proper header update first.
>

I thought they had been, I just cherry-picked them (although I may
have just used linux-next instead of linux-upstream). I've been testing
this under qemu so it seems to be working so far with what i've been
doing.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
