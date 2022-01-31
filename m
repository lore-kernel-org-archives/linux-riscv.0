Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D22C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 07:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59qTzLYXO+6f0pWzfd+y0AaBeRSrc60lEvOth46MzIU=; b=egNfk0GO1j2WDK
	yKP+SG7QF9G9vKERmI9K+TQFlafVWjngwm2SapKMOqaafntWNlzBVhEKsSfZnXBMENYsjr1ylpSO6
	CmCncEEFZ+O0DvhhxMHHUc5fE6cKcryooZ6cfQvtKAtX6CtiqUxLSlex7DXMgsiDraPeaf4ioAyDm
	znyOLoXBmHCMWXnA2Uc6lc/Wb1vXS6TxObGH7bRNUDr7w8b9fVzfu5Oh+/AIUypPJbkppH1Idn0dZ
	6XvWF0cjwAwW7e50eScdyHE6rMNoS3b0bT84mpaZZkOtkiN8Tfb7PH/Z46FGIPrQ7JJJFlUOvALlf
	Ja+gN2ADj9ERJOdaubaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nERRE-008JbE-NM; Mon, 31 Jan 2022 07:49:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nERQt-008JS8-Jm
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 07:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643615341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAt16hzi0jARVC2SH2tfH/9B/mqcxkzoEuuB90n1AMk=;
 b=YdNRTDF7s2rwTzr0iaGT1wa5kuJi7LSsWieJOyv1Ttao0XmJd93RggnOQhC3dLT6XxRhGi
 KWOJc1Mw0IlrAYLank3w8Td9giU0Fh4yvH74E2fmhubDLzPUueYMvvJYjcQy7V95LwyX4W
 R/cIgJSFqMMk2+rp+lvzdhVLWcHimIk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-4z2dZTpFOviyfSSm20aZ2A-1; Mon, 31 Jan 2022 02:48:58 -0500
X-MC-Unique: 4z2dZTpFOviyfSSm20aZ2A-1
Received: by mail-wm1-f71.google.com with SMTP id
 f16-20020a1c6a10000000b00352570ae3b8so1069941wmc.8
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 23:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZAt16hzi0jARVC2SH2tfH/9B/mqcxkzoEuuB90n1AMk=;
 b=r562HY4eAX1wJkvJ5v4VLTw+cMiIIlFs7AB9yh3KhIjtdXrbgMKbxmzCmc+AYF0sIn
 Dl77PcmuXtVAA+Qg/zmK9/BN+d4wLul0tTExBGWcPhwajRcBNwM9TDRL79eP39uCWim6
 /ok+PpQKCMWeYPsLXW1/m+lMkqvgkGE50Mzq51AOX2DZTMHxz6zRvA07Y61dzrGOwoIc
 qyJWfXWVA6tpEBno4E8QxhZTjHupVV1lQDVu7Hq4NxTFkaN4ZH+HzgeEfa26yirKiX07
 WBVNjolhSXi+ycmHBS177AdlUO/BbvpPIUv2loJ8z7EsWN8YDW3L4hJC5AEQcl2GwYy5
 AlRg==
X-Gm-Message-State: AOAM530KeRGbl9MSWXgsDPeHjeoRFgZEW6FXjJw2J/u7hvpnmMWrIo4S
 0glL+/sDK7XSplFf0frbDu3abB7zcJIXbo+cRTAdrv8Xr1e/JcpAimOkG9xOy0+j3vHHE9If+gM
 aT4TPHoojqo1KdThBOQ6tS5bwMGp6
X-Received: by 2002:a05:6000:1008:: with SMTP id
 a8mr15911177wrx.563.1643615337600; 
 Sun, 30 Jan 2022 23:48:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziNLNeLdU3x1hO5PuIt8mvz7fg18Pv6lGvSgHdK7fS7xha3a7EYrVkbUytI3CwE4ViZc3ZTg==
X-Received: by 2002:a05:6000:1008:: with SMTP id
 a8mr15911171wrx.563.1643615337390; 
 Sun, 30 Jan 2022 23:48:57 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:b200:f007:5a26:32e7:8ef5?
 (p200300cbc709b200f0075a2632e78ef5.dip0.t-ipconnect.de.
 [2003:cb:c709:b200:f007:5a26:32e7:8ef5])
 by smtp.gmail.com with ESMTPSA id y6sm5081791wrl.46.2022.01.30.23.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 23:48:56 -0800 (PST)
Message-ID: <3be2e20c-f0b9-c080-adf4-b0e17c046eb0@redhat.com>
Date: Mon, 31 Jan 2022 08:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
References: <20220128151540.164759-1-david@redhat.com>
 <YfeARpenqPii1WQH@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YfeARpenqPii1WQH@localhost.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_234903_784807_ED603B39 
X-CRM114-Status: GOOD (  21.47  )
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

On 31.01.22 07:23, Oscar Salvador wrote:
> On Fri, Jan 28, 2022 at 04:15:40PM +0100, David Hildenbrand wrote:
>> ... and call node_dev_init() after memory_dev_init() from driver_init(),
>> so before any of the existing arch/subsys calls. All online nodes should
>> be known at that point.
>>
>> This is in line with memory_dev_init(), which initializes the memory
>> device subsystem and creates all memory block devices.
>>
>> Similar to memory_dev_init(), panic() if anything goes wrong, we don't
>> want to continue with such basic initialization errors.
>>
>> The important part is that node_dev_init() gets called after
>> memory_dev_init() and after cpu_dev_init(), but before any of the
>> relevant archs call register_cpu() to register the new cpu device under
>> the node device. The latter should be the case for the current users
>> of topology_init().
> 

Hi Oscar,

> So, before this change we had something like this:
> 
> do_basic_setup
>  driver_init
>   memory_dev_init
>  do_init_calls
>   ...
>    topology_init
>     register_nodes/register_one_node
> 
> And after the patch all happens in driver_init()
> 
> driver_init
>  memory_dev_init
>  node_dev_init
> 
> I guess this is fine as we do not have any ordering problems (aka: none
> of the functions we used to call before expect the nodes not to be
> there for some weird reason).
> 
> So, no functional change, right?
> 

Right, and the idea is that the online state of nodes (+ node/zone
ranges) already has to be known at that point in time, because
otherwise, we'd be in bigger trouble.

Thanks!


-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
