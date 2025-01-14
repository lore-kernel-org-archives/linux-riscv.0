Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C733C02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 05:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swmHZRFSr7sgKVCT7bBKChyZ0SlhvR7ZGA6OyRYMmAw=; b=e3ViCltUW423F5
	XCXty3WrHQeiyMUriHL91f/uINX5hwZ4a+8c1XlLa4ZrXyvOeCBUTMcyV4Q2/qgIzgNd/z3Kb8BjJ
	hgxq5CqdDDyf0mh+PG8qNzs5xJCa2NSskLnnW5AKyBlEUip6dlYs1MKaGanIy4XjMtszCJAtcFDnM
	d+4+uqh/z61sdRIOxIhtr2ltuCYGXzoqd28vrMEwWSVVay2fH+d7KEDYb1qygbQLrDXUL7tKhNj1S
	9NG0WTXGcEJf8zIrZd5+SbfP2oJanE+86XbZPIcHl6hXnUBDrxx+7+Fioj8STV0zBglAK0DXahl2K
	2TYGgLYOjm8TIEMdHMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZXm-00000007V0X-32Jm;
	Tue, 14 Jan 2025 05:32:50 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZXk-00000007V0C-2i6z
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 05:32:49 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-84cb9c4aab6so171559539f.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 21:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736832767; x=1737437567; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f1Bp10ZGkW5gD2RlZUXeDywURBlq4mu2M9HqJf63BKM=;
        b=DlzPfOAcoLMzVPHd5MLlQ6l4RQZ4Gk8AJzAU63IJ0uSrRNy6jQz8rhnK15fYdzD5Fh
         Wp9bKIy6j55KpyiqkSwkuRBHap6QU7MvJE8mcTiUtbGLrJZdfRE+qw5WX2X6ISkcEe6f
         t4wD7Avq2f/qjRwZw9659Ab1SfTYSSDElw8sxU/JXXyKWqKooAp4OF1j5fizizAADliS
         B0RAggC3RcRdK9I7JzdwrUBmSE63wbnK1nSQa7yaQRWwm0C4Io6CILM8OupmgCjcKXqd
         R7wGZlWuhzGq+gBzAGOO9PttsVq95987N6pxLVxnSIikqTksE31V5P7D25iuoteZCU6Q
         cuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736832767; x=1737437567;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1Bp10ZGkW5gD2RlZUXeDywURBlq4mu2M9HqJf63BKM=;
        b=DMlI0HjNMwfsndrh+yMIuaA6PdIFpSl2K5o38u6vbdN+JVtrnrT6B3gUDjBazxdMcS
         YtbavcF4VEkueBdwGCh4XrYk1wvnO0iKkw1sEm9DSLcvqbSurlwjLHJYRTWHJkgGQKrg
         D4nOKkZkAXbB+k48c/yOaBDB2uZgETV3tp0pQmu15EOyLTSLyAGYE6aDRFhWwAA0i+Um
         CuquTtSiLgSM1h8AqBAV0hVTXkdb434OoIKJMDrjf7diKGR01hPixGoUCOEcxCfxBnRB
         vnFxhY6Qv55cOB5Db7pZa5MBRedHdI3i93LIxXPfKECvpZ7gq0rMlDRlKPhVGz9IGT7u
         eXFg==
X-Forwarded-Encrypted: i=1; AJvYcCUSF5jQtLQeLiMpGAj7YOnXaTEirKgEdLzpbBAyq1RyqdCqePwWHffMEWBfy7ACTYM6eMltXP0kjbygEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpKCauTo23VU33J5lhkp+zaDG5p7KhPc23deFKG/3CtDjXg0td
	y7ay6x1eTq6TVlaifIEx8bnM9dJGq8vL3N7EIGo/wR8UzeeuawF6RhExxd4K7xk=
X-Gm-Gg: ASbGncspohV0IM6/4lcZ+BMeyJGxT+KjwzBTOxPgcdbssG31aaPbzUR4lrAMqa7p3h7
	kFvWasb5IMvICWl3DTP8CwAo2/M0Ji6f5c0JzZ+DHj4cms8h5u80RqjMQ9n/zOeh9yBwyCJQ6eB
	bZ3D/RVIt9qJkyKoq08COQybMIOygLHwhEY2FiU9hMrSSgDF51eP+ZPkBVhPCpkIlwVUfhL7DeO
	eBY9U/owP7tWsT07vK/F59q8Tg4AjHnIn6ZryWYKOAtsItqmY74xPWYlKMU4yuDdU4aqmmYFUIx
	vslv
X-Google-Smtp-Source: AGHT+IH4xYP4M6DhMu3ld/by2JdHK1yfyfQFeSU+FypC6PibjVehEMl4FyLmPwAvmuuWc6iZj61OWA==
X-Received: by 2002:a05:6e02:138d:b0:3a7:e103:3c43 with SMTP id e9e14a558f8ab-3ce3aa5af3bmr25675045ab.19.1736832767477;
        Mon, 13 Jan 2025 21:32:47 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce4adee7bfsm31862735ab.44.2025.01.13.21.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 21:32:46 -0800 (PST)
Message-ID: <fa984379-29b6-4093-9213-6a291ccc7e23@sifive.com>
Date: Mon, 13 Jan 2025 23:32:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] RISC-V: selftests: Add TEST_ZICBOM into CBO tests
To: Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
 <20250114021936.17234-4-cuiyunhui@bytedance.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
Cc: ajones@ventanamicro.com, alexghiti@rivosinc.com, andybnac@gmail.com,
 aou@eecs.berkeley.edu, charlie@rivosinc.com, cleger@rivosinc.com,
 conor.dooley@microchip.com, conor@kernel.org, corbet@lwn.net,
 evan@rivosinc.com, jesse@rivosinc.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, shuah@kernel.org
In-Reply-To: <20250114021936.17234-4-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_213248_694351_04D1307B 
X-CRM114-Status: UNSURE (   8.32  )
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

On 2025-01-13 8:19 PM, Yunhui Cui wrote:
> Add test for Zicbom and its block size into CBO tests, when
> Zicbom is present, test that cbo.clean/flush may be issued and works.
> As the software can't verify the clean/flush functions, we just judged
> that cbo.clean/flush isn't executed illegally.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
>  1 file changed, 55 insertions(+), 11 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
