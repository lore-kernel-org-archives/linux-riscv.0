Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C43DCD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 03:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4514pf14gcLQI9x1xgY48zXa53G4ltzSC+JFqNumwDE=; b=4IRWbXEtU19BZa
	NS0NGobLz8wTVU50t1aZGreVTazVtXJsokC5QReYYWeP8UbnRrEpgXFLyjFg/4QgbldYNUybTM+HS
	JkQxL2FWxP/e6UXeF8iNqP/MED2lVAY4gphLnRHAHE9toxz47Zh5VJk6Yt6Fl9q6jTKbHQb4EyaQj
	J2skPzXZUGGHijJA5o/aMZiSfEKOEAIL6N1xSJqQAcFtuGFwHCDnpKXl9I4CW6hq8BetheI1+TUtE
	GtcHMKE55AS+2hcYAYlZrbpeKMQ+2xGnS1AOGdNwe/el1rYhEymnV0HhAqyPrf8nYn+B/OvG1eZFM
	dGdLlK3b0TjiZ7gdYhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy5K-0000000DWlB-37v9;
	Mon, 15 Jun 2026 03:34:02 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy5G-0000000DWjM-2PM1
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 03:34:01 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso881317a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jun 2026 20:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781494437; x=1782099237; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4N4VN4U8dWKYBPdGLpmGB0dN8xMC6v/gON67oih3Zak=;
        b=cPTzYIHdKjqkZupaBHV1pLHoJKoGfWGZ//Js7rf7j0h3gwPUJxTgFGGVLruyHWbSEa
         GD02hgNomiq/99S1jftY0PRDG1yMoPjvX0oHA+0WSnvxQIvxGLkSXtTXCoIVcE/VTBsW
         OpA5ytTySBG9pakfLL4E7yf3FBVJzk8GYvZp/dCap9twnSD+Hai637X7aP0uzm29cYWp
         OROavm2CpoOyAHsSK1S4Bk4zuXLs33DAPCYtup1dciX86cXV97ogDOUzWciFoLAqB9Fk
         z/gHTou0vodja2hAtBNCQyQrQT1/o5QeZWlwPunj6ZITrbO5B465jGXHOUuPf3ll+s57
         RQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781494437; x=1782099237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N4VN4U8dWKYBPdGLpmGB0dN8xMC6v/gON67oih3Zak=;
        b=pmLU31kc3jOErO0+X4isvKtRjiu6A4t2myVXCZ8G4T8YoTnJH5El8qnsHw5vd+aae7
         ZB4+2zNL79fjYgqRsJe+hJAPwpcuveXBK/S5F0dw8/a0tQjD+18thn6bJ7zZYDevXhPc
         6Ioxfn/ypFMyHv1Yf4kt4xxjWF1vmSfKw0jHbElMWOY+BajemZcHMRi94kMXvcuGizgG
         6odTAa6eo5Xx8URhFtzE6sOFFOXivQRk1R7v0LLwzp1rjbQ1fRzJ7grahC2aWf0jvYDw
         7XiNhbkipftvF+aaGSknL1PDFGukgZ9WL5uUj41RtJL+i331eH2qqwoZ/uayKrq6CgiC
         qfoA==
X-Forwarded-Encrypted: i=1; AFNElJ+4JUWyE+SerBHYLtbjtjmNhN2fl8bDeUL2NxXHgyx3Ikk7+huH5z0ndE5C6UqaPVW6TCfGzAz8xzPttQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYZZwtj7Y3ZHePmfgXjHqMJBk0hx1r3Ggm2IXpBf0LJdgyYD6a
	iDLt/TNX+C+JaJQAVg2XygN8HdgQh+bB+TE9eu2sRrhbXirNyIp/9zpL
X-Gm-Gg: Acq92OGJbLQHEJx+UIrSSlevW01vgmugABrcd67ajVEpDW4IejVE+kUiOFYNyJXobBD
	6iQX9VJlIMn5KPhp1E3nEikTj2QMALm7SnFkaMg3t0KZlEuh1QlZ0LIEY5hRa61OdEy2SAohAjM
	v0TDLK2heAzDHcCSJV25cp17Bs68WD8p1AqZU9HjrkYH6zKwKEKqrbbYUtyGx4X/dWW9FpUwB6e
	x6gJBiF/vTSnrVlnCpzXuRDD9vrwEHTLaP701DUkF+4/Y/3GFafkX1OQAds8lYyRJJhr3OfoMUm
	4/XntqBaGKgRG/dPaUWgOeqNSTnSdsKu0k4lbyK43tJMI6VK2cf+dM8A5e8En+BmclVl7neBvlq
	EhnyYjKa6s5xmU3nDCjmtxIlI5WtMBlB6lecyqBc/vVFJDngmpkVfgwblNOoxitukt7epskipZF
	s0YBxU5qP81FeX0P26x2HHFKqfwoRAq2LO5dZlnlIg+w==
X-Received: by 2002:a05:6a21:6813:b0:3a2:d629:16a2 with SMTP id adf61e73a8af0-3b783b757e9mr14493609637.10.1781494436758;
        Sun, 14 Jun 2026 20:33:56 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b035ce6sm8650381b3a.49.2026.06.14.20.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 20:33:56 -0700 (PDT)
Message-ID: <894d7c33-8e14-4ba5-b774-14062ece39f2@gmail.com>
Date: Mon, 15 Jun 2026 11:33:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] of: reserved_mem: split
 alloc_reserved_mem_array() from fdt_scan_reserved_mem_late()
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com,
 quic_obabatun@quicinc.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-6-chenwandun1@gmail.com>
 <20260612144122.GA974326-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260612144122.GA974326-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_203358_627102_9D8C23C0 
X-CRM114-Status: GOOD (  21.18  )
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



On 6/12/26 22:41, Rob Herring wrote:
> On Wed, May 27, 2026 at 11:29:11AM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> Prepare for storing /memreserve/ entries in the reserved_mem array.
>> alloc_reserved_mem_array is skipped if the device tree lacks a
>> /reserved-memory node, pointer 'reserved_mem' continues to reference
>> the reserved_mem_array which lives in __initdata, storing
>> /memreserve/ entries into reserved_mem_array would result in metadata
>> loss, and an out-of-bounds memory access will occur if the device
>> tree contains more than MAX_RESERVED_REGIONS /memreserve/ entries.
>>
>> So split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late(),
>> and call alloc_reserved_mem_array() whether or not there is a
>> /reserved-memory node.
>>
>> No functional change.
>> The actual /memreserve/ population is added in a follow-up patch.
>>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>  drivers/of/fdt.c             | 7 +++++--
>>  drivers/of/of_private.h      | 1 +
>>  drivers/of/of_reserved_mem.c | 6 +-----
>>  3 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index 82f7327c59ea..83a2a474831e 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -1284,8 +1284,11 @@ void __init unflatten_device_tree(void)
>>  {
>>  	void *fdt = initial_boot_params;
>>  
>> -	/* Save the statically-placed regions in the reserved_mem array */
>> -	fdt_scan_reserved_mem_late();
>> +	/* Attempt dynamic allocation of a new reserved_mem array */
>> +	if (fdt && alloc_reserved_mem_array()) {
>> +		/* Save the statically-placed regions in the reserved_mem array */
>> +		fdt_scan_reserved_mem_late();
> 
> Can we make this just:
> 
> alloc_reserved_mem_array();
> fdt_scan_reserved_mem_late();
> 
> We already check !fdt in fdt_scan_reserved_mem_late().

Thanks for you review, Rob.

The reason I kept the fdt check is that total_reserved_mem_cnt is wrong
when fdt is NULL, early_init_fdt_scan_reserved_mem() returns early in
that case, so fdt_scan_reserved_mem() never runs, and
total_reserved_mem_cnt stays at MAX_RESERVED_REGIONS. Calling
alloc_reserved_mem_array() unconditionally would allocate unnecessarily
memory.

A better fix might be to make total_reserved_mem_cnt always correct, add
a !fdt check at the top of fdt_scan_reserved_mem() that sets
total_reserved_mem_cnt to 0, and let early_init_fdt_scan_reserved_mem()
call it even when initial_boot_params is NULL. Then
alloc_reserved_mem_array() could naturally skip allcation when that
count is 0, and we can drop the outer fdt guard.


There is still separate UAF issue (fixed in patch3) if we don't check
the return value of alloc_reserved_mem_array().


With the fdt_scan_reserved_mem() fix for total_reserved_mem_cnt, the
call site in unflatten_device_tree() becomes:

if (alloc_reserved_mem_array()) {
        fdt_scan_reserved_mem_late();
}

How does that sound?


Best regards,
Wandun

> 
> Rob


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
