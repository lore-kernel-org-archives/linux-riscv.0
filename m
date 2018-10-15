Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C649C7112B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 02:13:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3296521470
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 02:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SCnBn/0t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUeqgHFO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3296521470
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D87QLUII3RR77/LHA6UNQdxs/LFW92XXCGUWGdD29QQ=; b=SCnBn/0tP17a1ASzN3KNFQ2yG
	XrEg5oUFQBLoaP8XXFTJ/5y2wVkiJqdeIimDO/Y1WTPvTVDBV8Fg+SVW0zVSrjeRUzEkVJi5W2BYt
	vXjbGup2ugoZSQufdmU1iHvB0EHi1EI6fKeKB9UU34OwD5qu9n/7rABwSHIIi+exa4HyRIisXkv0U
	Uehx7zYVj4TSJeNK8kfWL4sH8rxEoya4lePbgsgmLX9NdB/uZ7d3eXcWLfsCicC1AX/5uyNMDTv/s
	1hjE5EyFft/Cxw3yhJSGmtcAnvfnxoMvHHetBZQUnZRwP3sf7+OlBh4bJUW9elUSDQ2W9m0jSWAEm
	0egi1UNOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gBsOA-0003nP-Hw; Mon, 15 Oct 2018 02:13:46 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBsO6-0003ly-U9
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 02:13:44 +0000
Received: by mail-pl1-x641.google.com with SMTP id 1-v6so8492605plv.7
 for <linux-riscv@lists.infradead.org>; Sun, 14 Oct 2018 19:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ymHkumwBfmXw1IdKgqrBRDHgkGkvVYtpf1I/XYkRfXw=;
 b=NUeqgHFOo1DEp6SPKhcPs5f82LZ21QDaNiL7SY5WQ7kY0cOCg/xTDW7rG2rpXJgE7I
 2CsLZdQJCzWKdxFtUQIPoDMBpKNEzDtGWWrEDz5J2nKX3pw+viKSg09vieqFQZHbxKU6
 ujAbfNUztirm9YBvxf8M7yASg2sjx8Xvjx8OAB07T+jAACL0/o+94ADGnPLWohSmuvgs
 ItZ1iuarrss035SZ1xUmm+P+6W0NPBDuhqRbPeAdQ9zyeOGAivE9gh76kB7yMuarvy4B
 wPlFjmqcefNNDkEYfQkgrw6Z2dA+uQ78MS63sHvSpmmOJAj/G715I532ib6i06V4A6TE
 hQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ymHkumwBfmXw1IdKgqrBRDHgkGkvVYtpf1I/XYkRfXw=;
 b=J1ssyZ1ObZXlPkERO9xLHwABLVzJUOsFcaKmLkb3lAZ5ylOIb4ObQkDpXptV0hc4N7
 fm7Q33bADpq1BdN3FhK/9H5tuAmq+oIBGOEmAZ2YrRkufEWmpw8o46go/zmRwKzrs+Fl
 qKQZzTT2aKoMXzgRKSOxlvBJEzKkwSh1mbs8LCqFoGYHT13Pa82+JyzULixG03aJqOST
 iETYP87La1mKu4bhyU+iw13E4NddHxkKMIG5YQTBqTmiTORm7zTLDqsZvl946BmoXezC
 YAtl0/iTz4y9GK6yIBEOB2V6sYVTdjc+sOsic/LfxneO7cNKiz4qh4spMMtgmcO2i9g+
 LIcA==
X-Gm-Message-State: ABuFfoiCESWIHgL0e4doGFGuYc8HeAx5RE4VrceXsPKRXBoJE2eCd+7A
 /EzwJZymPbALXnwHc15a4SI=
X-Google-Smtp-Source: ACcGV62ywVHTbTtOqL7QyAb5COYIKb8Kq+f060IngduKuJZiTABpH9GuUgtwbI7vVoRJhxgSP1N9oA==
X-Received: by 2002:a17:902:a5cc:: with SMTP id
 t12-v6mr15564485plq.229.1539569611869; 
 Sun, 14 Oct 2018 19:13:31 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id s23-v6sm10930610pgg.67.2018.10.14.19.13.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Oct 2018 19:13:30 -0700 (PDT)
Subject: Re: [PATCH v8 3/5] Cleanup ISA string setting
To: Alan Kao <alankao@andestech.com>
References: <1539051514-3658-1-git-send-email-alankao@andestech.com>
 <1539051514-3658-4-git-send-email-alankao@andestech.com>
 <20181014000205.GA22333@roeck-us.net> <20181014234639.GA14835@andestech.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <1867bb22-1858-0f14-e077-5cb4b2e50446@roeck-us.net>
Date: Sun, 14 Oct 2018 19:13:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181014234639.GA14835@andestech.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181014_191342_975894_3CA28B63 
X-CRM114-Status: GOOD (  19.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong@andestech.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <greentime@andestech.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Vincent Chen <vincentc@andestech.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015021328.hqRq7muSCAK6Xkmkjga-U5-5Db5tCIOyBbB3j_z7eOY@z>

Hi Alan,

On 10/14/2018 04:46 PM, Alan Kao wrote:
> Hi Guenter,
> 
> On Sat, Oct 13, 2018 at 05:02:05PM -0700, Guenter Roeck wrote:
>> Hi,
>>
>> With this patch in -next applied, I get the following error
>> when building riscv:defconfig.
> 
> I guess what you meant was this commit:
> commit 0a5bee05fc67ce2044b8d91a18abbf14042da531
> 

Yes, sorry, I just blindly assumed that the last version I found must have caused
the problem. You are right, v8 actually fixes it (as suggested below).

> The modification in Makefile was
> 
> -endif
> -
> -KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
> +# ISA string setting
> +riscv-march-$(CONFIG_ARCH_RV32I)       := rv32im
> +riscv-march-$(CONFIG_ARCH_RV64I)       := rv64im
> +riscv-march-$(CONFIG_RISCV_ISA_A)      := $(riscv-march-y)aj
> +riscv-march-y                          := fd
> +riscv-march-$(CONFIG_RISCV_ISA_C)      := $(riscv-march-y)c
> 
> and the ":= fd" line was wrong.  It should have been
> 
> +riscv-march-y                          := $(riscv-march-y)fd
> 
>>
>>
>> What am I missing ? Does RISC-V now require a new non-upstream compiler ?
>> Or a special version of make ? I am currently using GNU Make 4.1.
> 
> So I sent the v8 to fix this problem.
> Sorry for the inconvinience.
> 

No worries. At least this problem was (is going to be) easy to fix.
And, yes, I confirmed that the one-line change above fixes the problem.

Guenter

>>
>> Thanks,
>> Guenter
>>
>> ---
> 
> And Palmer, it seems that the patch that causes this build error has been
> pulled into linux-next.  Any idea how to fix that one?
> 
> Many thanks,
> Alan
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
