Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252EDEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 21:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=aY9dz6mteYYWAphIy+gkppzRXChtyqq7Ytz0fjSMbl0=; b=o+25bdlEQWv3E3JwenAqnxzYAa
	K78MwfUI/CHzRHfipbK97NYngkZJry8a2CVe8j6pJcDCK49IRPyFOctTfPLOFaXlgcEk4o0B7urnH
	hHsi50dtDBlRIwawKpGNrJaIXFuedOvDSXD7LkZzfgiDPH9A21/n8HkUwRgd+OuQdf4kzXFN62/j6
	Kt4R+m9gzXmGl7SVz6lLexP+MIuIrN+EpSdp6dUmP6KwRBBf5qSgvdZYaluQCbne0ZHxGmFG3m4KL
	PUjtaNa2M9tgwrrg5ik/uUHSwnbVfyU0dZ95srlQf63EnTg3k4L+cyjQCL/EppAixu+A2yACe6UF5
	ZbvvorWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWal-002jlh-01;
	Thu, 06 Jul 2023 21:32:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWah-002jkF-2R
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 21:32:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b8b318c5cfso7705915ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 14:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688679158; x=1691271158;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6v/ILGDbyO6izqW0/CzDnGZbd6OjuOMQSm83GDcJTo=;
        b=ycQN4SuI86QJ69YA41U57qJyI5IB1K4PefdWdSeAGvL2//RXCpt16YPSRvpSgNZMQ+
         huEfQoBKxicH82/xLldnayx9uqqfSIQQD6/7WOZ4rfAmkGF6/ViAIpjJ1NSPTBkQw/6r
         CWlK3punnKzR0Db8gNyzl63oc6tqNolNiwO2JxLvf2HU+WE+mF0dHeNwQmXKwDQymMom
         8pF2sajUDgwzNCmqc9WQnGcWIP2YqAeJ2BopF2lUrW7vfboiPosB7cSOkT3NLByMThUH
         JRblsIor2yR+5Jl/1NIlo7lg3GhPsHYIDgWvFOxn5Pg3npMPE29+ZH7PVYrLvADP58e1
         jfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688679158; x=1691271158;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6v/ILGDbyO6izqW0/CzDnGZbd6OjuOMQSm83GDcJTo=;
        b=X6O/Xr2ZdF+z7urGK8gPyiiL4QkFj6GjU6K2UTRFV3wnkFtwKpACy0pSf1/HYpAju9
         ZMSkTjdq3a4kEaQiuccq+6jYHW8oAHu+XVSeEOuGVxCgAjgkl/kAymIhVUUGrWJCVLHL
         NuVrthbcn3UcMEjTlj7SJ2M1ba74OrmCdRVdZWmpcFMOA2dsg1Gvzcqqnkxr7UJ4fAhJ
         YbCRAL271lyDRPtkSlspZ8aNxUZIaWD4zHsIeB8B86fiN67otrMa4RJLDxRYpPYiiHOm
         8w7Yn0gtFARF8KG+NSjRiOlv02KxMnrR/Grz9oA9Fkuif7VGhS97OLX7CLM4aoot/6iX
         hwvg==
X-Gm-Message-State: ABy/qLahQRlyd+uSCq08htc8XLNATsIUxn5BLjSONkdTlgAOpzsZu/ta
	cHl47jyZIjIbXvSikTSs9N0D0w==
X-Google-Smtp-Source: APBJJlEsMDo/o3Ml7k+rB/oRadWtQM90v+nx/vC5/uWVqs97yvJbqK2JmJngQaF5+v4IZtUvjxTMcQ==
X-Received: by 2002:a17:902:c951:b0:1b8:3e15:46a1 with SMTP id i17-20020a170902c95100b001b83e1546a1mr3944703pla.67.1688679157789;
        Thu, 06 Jul 2023 14:32:37 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902d2c600b001b549fce345sm1835412plc.230.2023.07.06.14.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:32:37 -0700 (PDT)
Date: Thu, 06 Jul 2023 14:32:37 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 14:31:51 PDT (-0700)
Subject: Re: linux-next: Tree for Jul 6 (arch/riscv/)
In-Reply-To: <9d9e2902-5489-4bf0-d9cb-556c8e5d71c2@infradead.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-a4ed8be3-1e00-4604-ac93-29d893829988@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_143243_791940_362CB326 
X-CRM114-Status: GOOD (  10.46  )
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

On Thu, 06 Jul 2023 14:27:53 PDT (-0700), rdunlap@infradead.org wrote:
>
>
> On 7/5/23 18:57, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do *not* add any v6.6 related stuff to your linux-next included
>> branches until after v6.5-rc1 has been released.
>>
>> Changes since 20230705:
>>
>
> on riscv64:
>
> WARNING: modpost: vmlinux: section mismatch in reference: $xrv64i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0+0x14 (section: .text.unlikely.set_bit.constprop.0) -> numa_nodes_parsed (section: .init.data)
>
>
> Full randconfig file is attached.

Thanks, I'm giving it a look.  Do you happen to also have your toolchain 
version easily availiable?  The mapping symbols are new and we've seen 
some odd stuff happen, something is likely broken somewhere...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
