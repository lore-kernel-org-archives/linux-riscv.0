Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CE1C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 20:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qn8i1Iy6YwBVLHF6N4BqamdB2PkNxjDgoI0l0mAQzx4=; b=wAujAR8sYOX0jp
	3Gn6T/CUMChqL0o7In/gECBWMW6h8MIMP42KCEX/Lk527CEndMVkpdVO3BWL1UOQHBeBHqy/e0P8M
	u3j0oHtAv0BzOq+KsYbcFqKPaW9Nf4CAMEtqTnyURwglpsfgAdVDwxCxuIrvdNlkQ7VLgFT4NJcYN
	0ULRxzkikcYqGLLlsHVwv9EdfDDXL2Vq4aTKKEGeCTnC7IgmKV3S9VqFnOOwgsI4B16GFXtWgkM4B
	AUqXls3vt7jBqJMFe5S1FE5pozpNpBkrSO1XZJvpO3obln8MDu5pi8Er6qFBj8L+5WzmxIxwyccVT
	7HlCgadbIRKbHfJtXVPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7UC-00000001jAb-0CtH;
	Thu, 08 May 2025 20:04:52 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7U9-00000001jAF-3Zad
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 20:04:50 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-85dac9728cdso36767839f.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 13:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746734689; x=1747339489; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+BZjOLU7Mj7gmvFl5R7+Ucy0sGYtXH0NW6caQm2Jkt0=;
        b=jW5ufOURHholmPhJgYWASRYsiZSFFdZVhqNYNqsiQOXZ0L7uXoBkfb98ehXJMQLafu
         NgVL1w/D+rkhjOEhQEAmM27dxrx8AfY0CKYYPOxBg0b8nCUGVl9MgeLdcBK5xqckNyit
         uDGN5ouQcfULFM40Hj5Drte/LtPfWb9AJgRacigCzkfwaU4CzByyvOmK8c8QGIqyS+fs
         D/qxguXnIYgpxPQ2E64dWaacLMs/vFiGskwF4MIdTfb/hskXmIEc8uLPFUJDuJKN0Vdp
         XhBV8hyMbWNxf8+urhjW2yLAto6NnlQaxsZ+ae5eRWWorpCWZ42QHfdrgkRzVhtr64w3
         WY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734689; x=1747339489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BZjOLU7Mj7gmvFl5R7+Ucy0sGYtXH0NW6caQm2Jkt0=;
        b=W5R1EKu9gX8UF8wZy+Chb4/MHNdxK6ayez3O11oqaRrrQOq+NiZDdacOEbH9OHJRVy
         a5BluytjKpp6QM3k/7jO+a6VNGn89bmpaCBJ3TZ3t4BiEERa7ATiswvNY4yG/LxncoY4
         qndzIsag7Tb9YG/K4PMzCDQr+slCFyOLmAbUUGeRpdWupXFrZvg9tVwoZp12mdTgszr8
         qs1vnE+cUJMYD+hSzJe2TTe4Naao7qa78jOEg86O708SdgmK9KFgpBILa6jt8oodQ6vq
         6KiZZFfeH/SLEFx6RRKpfvflIKfs7E1tg9HcMeiphzaifPid+p3GMcZ1sVH1VJ9OfmTv
         loMA==
X-Forwarded-Encrypted: i=1; AJvYcCVPGKSLSOIHQqQLmneoIHfbNERKbqZxezt/nrzOAx/z4+rVRyqpdtuO1m4PtXSjj8zsM6e5TA484TtpOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKPAQoTbld3omF8v7EcaWOi5o8C43x2Pyxl6WDk2SzmxmtsKfq
	RIfPf6wJfCra05UNO210ocodyTJDYtCihDq/h0j6DEfQjGZkSh885TetVhbCZUQ=
X-Gm-Gg: ASbGncvucwO4UUy8t1k7D7F6tEWJ8gwH7x+x/W8omJO9o1IboY/uQKu/vLyfbC1/ZN/
	JKq2BUACMT6t1PYruczjh1BBihWBUgtf0xLyNhsV9FYRXQr6hygYuZdgmsMlstZwXZpW18IxbP9
	QISD6OGMXVvJfQMQ6r3Vh3uzzEsxZ7RkIfMPlJZaK2FGC2K2+kkn+iOuxezgIzYLMqr5DnxoQmW
	A1CVVZlkwwFrPY6oRljfCI1/iyf6T7fTVvMQPoUm0FS8M8fgpgozwX+O4zBqSUWnb7sFMppvA5T
	9kXV+nloc0SZWXcPPxe0/MYyl84HXu19+1rU/w90d8FsCN9zU86DnUKKIKQXwGS42yK4GRBVGGx
	OMRmu
X-Google-Smtp-Source: AGHT+IFxdpedis8rLgUjioQVN/bR03F5zkFpjU6epV5YkxNIoc+m7l63P5vylXM+RdtkVFMExNl8uQ==
X-Received: by 2002:a05:6e02:1845:b0:3d9:34c8:54ce with SMTP id e9e14a558f8ab-3da7e2103c5mr13250945ab.18.1746734688787;
        Thu, 08 May 2025 13:04:48 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e158bfcsm1192895ab.58.2025.05.08.13.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 13:04:48 -0700 (PDT)
Message-ID: <dcc42499-4c6b-450e-8449-414501d6ab62@riscstar.com>
Date: Thu, 8 May 2025 15:04:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
To: Haylen Chu <heylenay@4d2.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-4-elder@riscstar.com> <aBw3KNwjMeCIfnNR@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aBw3KNwjMeCIfnNR@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_130449_897525_6A20FCE0 
X-CRM114-Status: GOOD (  28.41  )
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

On 5/7/25 11:46 PM, Haylen Chu wrote:
> On Tue, May 06, 2025 at 04:06:34PM -0500, Alex Elder wrote:
>> Add a new reset_name field to the spacemit_ccu_data structure.  If it is
>> non-null, the CCU implements a reset controller, and the name will be
>> used as the name for the auxiliary device that implements it.
>>
>> Define a new type to hold an auxiliary device as well as the regmap
>> pointer that will be needed by CCU reset controllers.  Set up code to
>> initialize and add an auxiliary device for any CCU that implements reset
>> functionality.
>>
>> Make it optional for a CCU to implement a clock controller.  This
>> doesn't apply to any of the existing CCUs but will for some new ones
>> that will be added soon.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 85 +++++++++++++++++++++++++++++++----
>>   include/soc/spacemit/ccu_k1.h | 12 +++++
>>   2 files changed, 89 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 9545cfe60b92b..6b1845e899e5f 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
> 
> ...
> 
>> +static void spacemit_cadev_release(struct device *dev)
>> +{
>> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> +
>> +	kfree(to_spacemit_ccu_adev(adev));
>> +}
> 
> spacemit_ccu_adev structures are allocated with devm_kzalloc() in
> spacemit_ccu_reset_register(), which means its lifetime is bound to the
> driver and it'll be automatically released after driver removal; won't
> there be a possibility of double-free? I think the release callback
> could be simply dropped.

You are correct.  And unfortunately I didn't include the fix
for this in the patches I just posted, because somehow this
message was not included with the group in my mail program.

I'm going to send v8 after I fix this and verify it again.

					-Alex


> ...
> 
>> +static int spacemit_ccu_reset_register(struct device *dev,
>> +				       struct regmap *regmap,
>> +				       const char *reset_name)
>> +{
>> +	struct spacemit_ccu_adev *cadev;
>> +	struct auxiliary_device *adev;
>> +	static u32 next_id;
>> +	int ret;
>> +
>> +	/* Nothing to do if the CCU does not implement a reset controller */
>> +	if (!reset_name)
>> +		return 0;
>> +
>> +	cadev = devm_kzalloc(dev, sizeof(*cadev), GFP_KERNEL);
> 
> Here spacemit_ccu_adev is allocated.
> 
>> +	if (!cadev)
>> +		return -ENOMEM;
>> +	cadev->regmap = regmap;
>> +
>> +	adev = &cadev->adev;
>> +	adev->name = reset_name;
>> +	adev->dev.parent = dev;
>> +	adev->dev.release = spacemit_cadev_release;
>> +	adev->dev.of_node = dev->of_node;
>> +	adev->id = next_id++;
>> +
>> +	ret = auxiliary_device_init(adev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = auxiliary_device_add(adev);
>> +	if (ret) {
>> +		auxiliary_device_uninit(adev);
>> +		return ret;
>> +	}
>> +
>> +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
>> +}
>> +
> 
> Best regards,
> Haylen Chu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
