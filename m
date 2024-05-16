Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAECDC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 17:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNXMx9pptkc21q7rFziVOucJdguHWSxWiFYX6jWhkP0=; b=WOkLw+UKuHrIe5
	X8jjAhzlKJTim27+QX4ySqERYUvfckvnPy+eX4kLKzqNreEGdPWtjtBQI9XBeUaxEbn6N4+gDw6ha
	dzEKnbbvmi90r8ZIcvRl5e0ryECqbV8qrc0vx3nkQbD9JLYg9dog+Swq4hbT3Q9CmRZaDEqtdkrId
	YYAwUQutJd6uhExsps9nlkjmH2+0bHaBHmlU0IRKrvBGr9OkO/iaJ9qnTAzn/tFt31GPzdQLlGj9Z
	UBEhFa9V7mjakB4FEVIrFt/z+2eAc3mNbQr0sZHtvaswbfeqtCCdptHLcCiY5TC8vaTh8HypCnkU7
	nWJchKshdhAdifNyy+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7fAk-00000005haI-2MvO;
	Thu, 16 May 2024 17:45:42 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7fAg-00000005hYC-4529
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 17:45:40 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5ce2aada130so383827a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 10:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715881538; x=1716486338; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OKXT2yQV18smkMXEV71PWPVmMK2iX3mlxflAHtbH2E=;
        b=kb2B+magl2bK2K+A4Qx2fVTDXfPBZATNVB13LdxVaNRHKlFEZF/9D1da+zCYwfmJHX
         rYnTcXZ1hgnf5SbgHbe4J0xY30gwur4NkUmX+wk68KwrIvj+Bl7z04q61XPxsbEhXOrt
         iZw5ivbPr7DFa/bxPO4BnZ+nCZw1ga06JPMAGXxKCzVck5v+ufsAa75SSkLqdRqorAev
         ixvlwDBou8eCnNbDku+guOEoFcH3Ii9+l1iaF4uFSnWOfKuue7G42zsaQmPZ1zRG+kTi
         3ShAR+hbhXciWRwEPmqxPb8+Cesuw12jue1EEd1plngBDxQUoNEIbCUM6pRkp3/Jd/sQ
         He/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715881538; x=1716486338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OKXT2yQV18smkMXEV71PWPVmMK2iX3mlxflAHtbH2E=;
        b=Rya14y/LjBjsDzXgPhVfRIJF/NLmf5IuG/aLJ7Mkqhj2blm6bmwXQ2Q89JyrhzC31Z
         SXOlnb1IW/b0Eg+a38nVo1eUC40tbBKt393h0MnaE+gwO+qt6X1MsevB9i3DAtUa0yKz
         ylkmbG/7Rn+mr3ak1ottZ9wnpR1128o8vAbDNbgw1S/B+55jhi6SKaBawHknik8CI5yS
         yCoakkDKa/clBB/QLUVZ96W0xNKwasDX+8YTrbuM6qpPBdu3sNsLhp5ARU+EK7cq1b6i
         1nc6+s7cBHvSy/aXRWzHCvj6wb/0r62zMBfuR9UAh6HJ64Dfe8yse1ZirOi0t/Kr5MWs
         Wa2g==
X-Forwarded-Encrypted: i=1; AJvYcCVV/TsyvKEo/ErX9NHvAEygAmK/7AvGvzOAIKrOz4K/eNz2fl7QUSyXbUGcZUjpifIML/+3OGD2xKhJ58EOEaFYhX43jRaG9r1LqTDJbQZo
X-Gm-Message-State: AOJu0YzuQ3nINg0+uaIy1AbkkWNCPx2/NVHcaqLc2559qig7djO1Y2DA
	zKbUIsk+r975Hi+v4dZsI0IFbhki4gqWPZNTy6ROQIcuckV9d9SM
X-Google-Smtp-Source: AGHT+IFlZdXQSAQjhwGSUSzAdvLTZnp4jX0Virj/NxOh9XLSYQQ0tW9XIzm5+SdWPO+zhn0VKlQUZA==
X-Received: by 2002:a05:6a21:3d85:b0:1ad:746:3f61 with SMTP id adf61e73a8af0-1afde1159f2mr17942555637.28.1715881537769;
        Thu, 16 May 2024 10:45:37 -0700 (PDT)
Received: from localhost (dhcp-141-239-159-203.hawaiiantel.net. [141.239.159.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4f2f0b6absm10208151b3a.76.2024.05.16.10.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 10:45:37 -0700 (PDT)
Date: Thu, 16 May 2024 07:45:35 -1000
From: Tejun Heo <tj@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Edward Liaw <edliaw@google.com>, shuah@kernel.org,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@android.com, linux-security-module@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 08/66] selftests/cgroup: Drop define _GNU_SOURCE
Message-ID: <ZkZGP9Io6o9Dhh36@slm.duckdns.org>
References: <20240510000842.410729-1-edliaw@google.com>
 <20240510000842.410729-9-edliaw@google.com>
 <ZkJHvrwZEqg6RJK5@slm.duckdns.org>
 <bec3f30e-fc9a-45e2-b6ea-d739b2a2d019@linuxfoundation.org>
 <ZkYymMDd690uufZy@slm.duckdns.org>
 <9e72d97a-9a04-4423-a711-0c21c1c8b161@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e72d97a-9a04-4423-a711-0c21c1c8b161@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_104539_032562_63274830 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Hello,

On Thu, May 16, 2024 at 10:31:13AM -0600, Shuah Khan wrote:
> I am exploring options and leaning towards reverting the patch
> 
> daef47b89efd ("selftests: Compile kselftest headers with -D_GNU_SOURCE")
> 
> Your amending the PR helps me if I have to send revert. I am sorry
> for the trouble.
> 
> I can all of them together in a second update or after the merge window
> closes.

The cgroup commit is already pulled in unfortunately. Can you please handle
the revert and whatever's necessary to fix up the situation? I'll ask you
what to do with selftest patches from now on.

Thank you.

-- 
tejun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
