Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDFBC624DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 02:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPdwnlQcLcfDrJi++2N1JbeifEqg55Ils3aJr0+O4Lw=; b=sd969lkoaEChbB
	av31w+hWAGWfYo4IFh4BJHe7NkV66hwpGWNevmI0zixQcBgV9RR+B4JoNkjuhME7N/PIEb48CfgL8
	5Rqnnu2NLgbGJSTZEsLSa3wicyr4mBysKND++T5xzp1iOWdCKG7rdIfLfh9UwW2PRm2H0hHZZiHH4
	fgwQp50kJLKJr8rLefyUGKD94XigiJrlFccGZco8iZQVJjEU9ViHFI86/zMrjzldxQmmESP61moTv
	yMHXxMljy1XlRL+desgBLS+pXHQ+FzinL19MLVPdbPKkadUnCpUHrwSI3v8mT6n7StG/DE/yflQUo
	AOgASi8En/eqbnjC/Y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2JSn-00000000rwS-1Cec;
	Fri, 04 Sep 2026 02:15:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2JSl-00000000rw7-1Ub7
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 02:15:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ce98cb8165so5762515ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Sep 2026 19:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788488130; x=1789092930; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndeE7CrNCxxdH5dHnLsA71031MLc9UwFM/YE1dDZ/bg=;
        b=lm/I2gSXEDZ+iRr38cSlbLIbhMTLM0CVQ5UKHUg0aca5PiLvAn72m1FoimWBZw6Wkx
         CFIUie65d/nEwZvf/XhJjlG0jV+B6U3nCroS/k5aWF85rJDmO2dAx0oBSfgZRe1kjHW/
         5v3+rkzY+B78LUL0iU1hP22xh1E0U/nMh9aWim930bYMDf+AwUFNaXST0YRTwUS1PLlI
         DhVZQd+nVdClXSYuKS9IllJ1tmXIWqie3gHmmV+fqXjqDubUr1Je4CyCbSr+mlDH5wti
         azYILmH12nAyrV5lL0xIcDxma45aDYYSytzBmsBCKMtYq1YdzgNCK+UyHGzIxa3nDICQ
         PBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488130; x=1789092930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndeE7CrNCxxdH5dHnLsA71031MLc9UwFM/YE1dDZ/bg=;
        b=nJ9pyhgYe90tZgXXl/fsg+8CBagHT9Z1KzqE/+96rIPa0DZsPbceZxq5vNk96cI7bt
         bXsLdeodqhFw1hd9cVRzFclo1tpkM38pn89CmVt98l1j4LnjJQ11Eq1UdbTb5O19XQVr
         7KGzNxQxZeiJe2s6RB2VkZA/Q7RZiwzspMWAWpVQ/+U8cDUsSr8mW0LXoyMkUJjCRbFV
         rVU9AQJMO+G3GPvcX4o+Bg2cSdpU3LhBfs5GQUYixNxQI6KghrOaxDhNvuXD5H8VYgkg
         8I1YI872iidDbKdfNHSUzgEgUeBKB1TvEMwzeZafeLYUySiv9HCMS/7dHOiBIuK+awjw
         g7Kw==
X-Gm-Message-State: AFuF++kTsd+CRXiVzHnYpshWRuTiuTZ6KRipSYXViBmNUuVtKm64K4c9
	vWheyK2t7uguSjB+w9Cb7kn7iaMZFE2LgAyYPBuH27P+7qEmpvwC8BR7
X-Gm-Gg: AYBFou2eHW8D7I/jgUaBd7fnmQeKAG1Jgv1VDsmtQnTOZuULffJ7VmaOO8SRRw1PJ+b
	kSK0yNDuqJ4hzpCdk3dHWWdx815wZ65FUpwNzuuq5Tw51vP0HjwA0qMAiDq1Agvpvmtro7thr4r
	5HSdDgsWwcv6ko3Q/A6IknHb3cFROIwePxhr0brqYx8nkanOJFrNkz5ybqjy/F2Gig1ThySV6Iy
	9G+xo9Ar6TGQZOe2Iipmug5y7OeD2oXAclqWZQWZv9O7cOSm3+IsqXKDHwkQZ+keWWZtYJv46gK
	mlmiQ4uqLJCiS+JVQwR0uC+h/Jx96gjgeKNlTpz/0+oMxVvUBPCpxZwdEc/lPu36rls9bsZHMpk
	4NWgU5+TVy3Rf+rqv2Q912joZE2t8z1zggbt0zl3mVYMMiIkhcSblNW4tTk7UwfyzRWAh3Ewpu/
	22kKbhqEJcE+luEm8Jb49J4Cw/LClrO7pHFMkWQvZF0oc1iOseHTl2jEq58g4sioU509tlYGLd
X-Received: by 2002:a17:902:b217:b0:2ce:b3cd:7539 with SMTP id d9443c01a7336-2db159b5996mr10682725ad.6.1788488129501;
        Thu, 03 Sep 2026 19:15:29 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495a0b2sm3062125ad.28.2026.09.03.19.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 19:15:28 -0700 (PDT)
Message-ID: <1a7cf36f-aef3-4837-8390-5d063fab3e14@gmail.com>
Date: Thu, 3 Sep 2026 19:15:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/3] riscv: support EIC770X/JH7110 noncoherent
 devices with XPbmtUC
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc, lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, kernel@esmil.dk, devicetree@vger.kernel.org
References: <20260316060328.1173634-1-ganboing@gmail.com>
 <ee2b42b0-1489-478d-8c88-ced6b77824b3@gmail.com>
 <20260324-marshland-stretch-cc21ae7fdc2e@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260324-marshland-stretch-cc21ae7fdc2e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_191531_404995_4061E074 
X-CRM114-Status: UNSURE (   8.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/24/26 10:49, Conor Dooley wrote:
> On Mon, Mar 23, 2026 at 04:08:33PM -0700, Bo Gan wrote:
>> Hi All,
>>
>> Any suggestions/comments on this?
> 
> I'll get to it at some point, just busy sorry!

Hi Conor,

It's been quite a while, and I almost forgot about this. Any new
suggestions? Comments?

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
