Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF28C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2tW3QWWer/PAdvfyQ3T/SPOjjg5NF+3253V4TK1V+E8=; b=V+x4u5PmNidpG7V13JJfko6eWI
	cMkH4wfUfNruGnSKsWhjHp7XThBBFbDB99M8HI74w9udFonUiA0YPArqZVUNhByPn0upVojj5Ut74
	t/pMTJTOmbY8zIMLijHOIJ0WConA8IT1eMI8o7PNHYh1FgWKYJ7uTapxeMi3Kv/2d9XebFn0bn4Ot
	IOzSK8HP9W+9/fzkHWkdxRdE2SowbpEVblHVu0CIp4K/uKEmIfp/gZ2vP3lCJiiCEYD3SfzQ/4buJ
	MCQM2cuuUXydgkWLdpbJFSAztJBt0tZTYztEsm9vOTPUr2OyK7jMsLUKXwnVPzStOUz/keT/5dq6A
	A/e1/feA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQByg-002tjc-Ks; Thu, 09 Feb 2023 18:49:02 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQByc-002thh-Gl
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 18:49:00 +0000
Received: by mail-pl1-x62a.google.com with SMTP id v23so3901017plo.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 10:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZIc/r7bYzuMIOjUvK2RHyGmiHZMKzy4Jer4EZvR+SI=;
        b=kzE5FfjwdBdIF/eeWlIsvAAck4G0O8J9DNcHqjkgNi66nqzhoJmKNtopyWw+sCQkO2
         o8ZnkPJRfwecnoJTc7bytUPqfju8U/eTB+fqHWmWh3ys3MQoabstp4ZVzm8Vk5ClL0yf
         F2uJEerQTOKROdhsTiVEE3+Ejg+RFcbGgW0bYz878jpvkzWoOVNnI+f9m8iHyiRvuCfj
         7E2U37xlGl+RCM46tHAjbH/y7WVk+gCFt5DDwvJI//1JP/9OxO1G7AzCE6ltviuf3Lfe
         jp1rGa2JkrUSuId9kW/cF/WNKD/+FEn5sXvDnbYf4C++C7XKv5yGXgsFJIbKKaA0qb4m
         zkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZIc/r7bYzuMIOjUvK2RHyGmiHZMKzy4Jer4EZvR+SI=;
        b=8AzoYV2pKju4jOaGzAdZa8o0o86fQpsyygkfVsEnG0XBYqSL3sjKrNnlfLTs29CGsl
         eIEXGIvkVWhMoetn2GUxMY++KM4o9bJnc9uAjK4VN9bE2L/TLq2bQMgA2+8kzsRM8Zht
         9eVkyxGVvEVoHujpPjjGnP29VYPhqy8A5E1ZyTLZr0jXr29Y42J7y0ENxYqXTEwLNEYG
         wwh6t2EL+Cxn6zM0O3yAtGh6MjdCpJ9QKzWWjm3uHlQUeBMal/nK/mKWlv3gMZeqQqmB
         qgIRCAzNFJL179a8rc5y7hywWXrSje8RSU9OTtNCYGrAUVJi0u+MT3l3IoocsqFz6/Ut
         aKgg==
X-Gm-Message-State: AO0yUKUDh8zwVGbvn6ZH0Gnulq1mV+38KRYFhscpDAeGJAT5Zej2pGtC
	wLS6u/YoHQJz1Az7XiHBzuS9xg==
X-Google-Smtp-Source: AK7set+kgwcYaWGpVCyc3+lgy7B5U35kA772efRGUmYujP80e5RphXKdpXTlBvyQNcCjSTtpuB/RRQ==
X-Received: by 2002:a17:90b:4f43:b0:22c:69e:3f23 with SMTP id pj3-20020a17090b4f4300b0022c069e3f23mr14163118pjb.12.1675968537389;
        Thu, 09 Feb 2023 10:48:57 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id gn24-20020a17090ac79800b0023114357761sm1691949pjb.40.2023.02.09.10.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:48:56 -0800 (PST)
Date: Thu, 09 Feb 2023 10:48:56 -0800 (PST)
X-Google-Original-Date: Thu, 09 Feb 2023 10:44:59 PST (-0800)
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
In-Reply-To: <Y+JnLkFlZ7ACW7A+@wendy>
CC: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
  linux-doc@vger.kernel.org, corbet@lwn.net, lkp@intel.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-aea2bf4a-210a-4645-a475-4ee232d42ec8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_104858_777383_96576381 
X-CRM114-Status: GOOD (  17.96  )
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

On Tue, 07 Feb 2023 06:58:54 PST (-0800), Conor Dooley wrote:
> Hey Palmer,
>
> If you do end up having WiFi could you pick this up so that the
> regressions report thingy stops whining at me?

Sorry I forgot about this one, it's on for-next.

>
> Thanks!
>
> On Sun, Jan 29, 2023 at 11:57:01PM +0000, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>> 
>> When adding the ISA string ordering rules, I didn't sufficiently indent
>> one of the list items.
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  Documentation/riscv/uabi.rst | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
>> index 2ebec4c52230..8960fac42c40 100644
>> --- a/Documentation/riscv/uabi.rst
>> +++ b/Documentation/riscv/uabi.rst
>> @@ -21,10 +21,10 @@ so for our purposes the following rules apply:
>>     single-letter extensions and before any higher-privileged extensions.
>>  
>>  #. For additional standard extensions, the first letter following the 'Z'
>> -  conventionally indicates the most closely related alphabetical
>> -  extension category. If multiple 'Z' extensions are named, they will be ordered
>> -  first by category, in canonical order, as listed above, then alphabetically
>> -  within a category.
>> +   conventionally indicates the most closely related alphabetical
>> +   extension category. If multiple 'Z' extensions are named, they will be
>> +   ordered first by category, in canonical order, as listed above, then
>> +   alphabetically within a category.
>>  
>>  #. Standard supervisor-level extensions (starting with 'S') will be listed
>>     after standard unprivileged extensions.  If multiple supervisor-level
>> -- 
>> 2.39.1
>> 
>> 
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
