Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAE0606A323
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 20:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bUuvIiGp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SZREsTBZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T4yB+I3LcmmGZUbTlhhs722updbT7G4vXCP253kUhuc=; b=bUuvIiGpu70GMjzSIDTfWW+BOE
	LKxGmmk/MNb6OFkeOb5/n1I47bSillFGUSGXFqJADAwaoWLqvrjEiAoktNFlfKuHH+as1Q3QpURNb
	ElaomDALU1iK40SW7pKRpRSAESLMIviEO+S1gVXof10tBbZKmops9R2fINHYwisdhVg8J8HmY9XEK
	XGJdXpxOrwQpV3m0EaTvWiiWZRzXTA5C5IRu2HoGbuNA34laNRvb5wXdN4+cmXY9kOM8ADCVBOffZ
	O3jZVtGt687kq2k8C+KPJfZxliGNpW0/d8at+3xCPx+b3FdPszmAcmcRUbGQr5wMPLtByO8SU4oCA
	JAeEeAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJBN-0000000BDNW-3mSD;
	Wed, 25 Nov 2026 20:01:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJBK-0000000BDNA-2MjA
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 20:01:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so80432895e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 12:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636888; x=1796241688; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9JAGDrtifzK74DUHuN7Oz65oLu+qbPYKqrM5bSwvXzc=;
        b=SZREsTBZ895ptsKvrdDj3uYisQpi94YdpHBIVS0Xv6Bwuod+h3wXNgT2jjyKq8bCz0
         mEXX3mSSwDZB+fAWZL5qUYyqobHW5StVVAAvU5jTm3wypoliAWbKVE9X/sQbDcPIJd3W
         lz7DP1t6Qv7D5Rbxnj3zAr7NlpVHwG3Siea7rixEsnbWz/cMTYwx9nmvyEeB+gRqLmRu
         wpd6yktrm0ymSmrZwJvYcasmXY7X82EVtvQRjCIyspj/qbgbXskH5oycjWRpyCZzhspL
         CJxirPx6HDefx9L9bbLEoBq52RWIyx8lZF2PzaMWiph7kaxu1WAz2UkzUbgwtUy0LA2k
         1IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636888; x=1796241688;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JAGDrtifzK74DUHuN7Oz65oLu+qbPYKqrM5bSwvXzc=;
        b=ESRVrPyywEd6zqFg2Zvu2tdLDDNY1jKAId2+4nBRysBv3vnOFxiMr5zOiQEKSPpdOb
         iSs3yvyND4gWj9BWsPdRIDgyKjMaJPtlH/HuQycTMNjplGjya0tKKEbC6xuM6zAtAsOT
         Ycijz+zML45i29z/87dNCA2kxCTAuHvR4FWUD+siO7fTsCU8N37Fq5yl/Z5bdtzZjhbg
         O0sKNft4IE+UBb3JZ0IWmGHrap2A/fWg4AoaeJd+Fo5RoHO1dSldFgdO1atfV+oB+Dlu
         Sd4svjRqEBMDhjZ09mV3xm24A7KYUvMpFbyD5H0p+qHNrol+PYSh0Rm2xuBSUbPLo/DP
         TaQg==
X-Forwarded-Encrypted: i=1; AL+hErFNb8T+V4N+kzH3v508WpWPombLcQ20yAoRBhZpemKemI6jRhg983nOXuMMyogz0SZzE/FcpFUd/3v9yA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+E159nRfAZ5nMPp1HBtjeNkfUp3vOy4Xi1m2yGr5Yu0Kvq6aOx
	ROUxlpSBxggUOl4/zbH7qR15f+RDK2f8m1uhQhOJrXQV2WkBQePrcqf7
X-Gm-Gg: AZFdTZfD3vpKBGUylV4oHxOAThpKM58ElWXs2WjeCTiiWCWj24yml++YdV73LjGRbnD
	wK82x4fevhYARTSjyru6x42SvKcy9/OZBDG4D+w6LtOilAOSEj+Ql1Tj2e6caZLvNCnW21qRW9C
	ikZ/MGIxfXAO5NJpEwObc+/yVkLGKAwJxr17w7+UJb/COdfsO/J0R73eXwdsFUNLk9bgfWAGBXK
	1KN3JeyLK5gPeJwBiNtc3C9R9a94K6XUB+4tJyxWj4Q/yBMN2Ume3O87jxI0p0lryuBEtGWyIFs
	oC+WzUpt6PdN7T+3/k1nBUKLTRP1zveJB4OPj+aiFGRHuy9ZUq2xlu55h9jXZr+uLzewKT15Jfd
	dmUNLqg4sXjTkOvHtRLjyG75hW9gNSlJnVI6dlFGHZerYwW+Uy4zCWnwBAPS/JiYYAEdozXBhXS
	H1w1yF/15MJYP9QWoMlfuA+RPj1Bq5/wLnXC2jw1RUYQ2mscobRSH7k+HZLOl+Lo4MqvNmRmtlZ
	oFkDVM1qjZLkQDZjTmSdpimOGa3g6sKI7NCTFedwZYXU8KXMVdEpWWTL3rK5kbD+QmTUSRD0R5h
	BJ6FfB3hprjEC23C/rMJyj8aJyVqzkiVlneAYl0=
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr389875865e9.3.1795636887762;
        Wed, 25 Nov 2026 12:01:27 -0800 (PST)
Received: from ?IPV6:2a02:560:4e7d:300::a1e? ([2a02:560:4e7d:300::a1e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1001738825e9.4.2026.11.25.12.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:01:27 -0800 (PST)
Message-ID: <68a8dc53-9eca-412a-8098-3f69cd7ab95c@gmail.com>
Date: Wed, 25 Nov 2026 21:01:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andre Heider <a.heider@gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Anand Moon <linux.amoon@gmail.com>,
 Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Junhui Liu
 <junhui.liu@pigmoral.tech>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net>
 <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net>
 <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
 <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
 <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
Content-Language: de-DE, en-US
In-Reply-To: <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_120130_666315_4D470CEA 
X-CRM114-Status: GOOD (  11.74  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25.11.26 3:21 PM, Anand Moon wrote:
>>> Apologies, this is a different issue.
>>>
>>> I am currently working on enabling multi-DTB support in U-Boot SPL
>>> for SpacemiT K1 boards.
>>>
>>> While investigating the board detection issue, I noticed that the EEPROM
>>> on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.
>>>
>>> alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
>>> 00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo... $....|
>>> 00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#.98a9c3a|
>>> 00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;........|
>>> 00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
>>> *
>>> 00000100
>>>
>>> Although the EEPROM is readable, the missing Product Name TLV entry
>>> explains why read_product_name() returns `-ENOENT` (-2), assuming the
>>> EEPROM read and validation succeed.
>>>
>>> Consequently, automatic board detection fails, and U-Boot falls back to
>>> CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
>>> tree for the target board.

I encountered the very same issue [0]. The BPI-CM6 doesn't have a product name in there either, so we just made one up and wrote it to make the detection work... [1].

I'd be surprised if the eeprom is write protected on any board, because the vendor uboot contains code to write a mac if there is none. And I've only seen fe:fe:fe... macs so far, which is the output of the code generating one (iirc, it's been a minute).

In case it helps, here's my collected notes about the topic:

musepipro: commit 6bc75cfa56e885c2eab80e215f0a610075505846
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 58
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Product Name         0x21  16 k1-x_MUSE-Pi-Pro
     Serial Number        0x23  17 BPMIMXXXXXXXXXXXX
     Unknown              0x41   1  0x02
     Base MAC Address     0x24   6 FE:FE:FE:XX:XX:XX
     MAC Addresses        0x2A   2 2
     CRC-32               0xFE   4 0x395ECD34
     Checksum is valid.

r2s: commit ac436e6879f5bf25e971d80f96f9392b61ff54c6
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 38
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Base MAC Address     0x24   6 .....
     MAC Addresses        0x2A   2 2
     Product Name         0x21  15 x1_orangepi-r2s
     Unknown              0x41   1  0x01
     CRC-32               0xFE   4 0xE5A74B18
     Checksum is valid.

cm6-io: https://github.com/openwrt/openwrt/pull/23231#issuecomment-5943699070
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 18
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Base MAC Address     0x24   6 FE:FE:FE:XX:XX:XX
     MAC Addresses        0x2A   2 2
     CRC-32               0xFE   4 0x9775FAA7
     Checksum is valid.

f3: https://github.com/openwrt/openwrt/pull/23231#issuecomment-6339373545
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 32
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Base MAC Address     0x24   6 FE:FE:FE:AD:18:9C
     MAC Addresses        0x2A   2 2
     Serial Number        0x23  12 0ca91c835b74
     CRC-32               0xFE   4 0x85C81AEE
     Checksum is valid.

     also: commit bfce75e2345fa1ecbf046e696994132f56d6db1c
         no product name

rv2: ?

milkv: commit 77156216f1d0f57e1cfce3452410db20468edca4
     only a product name

[0] https://lore.kernel.org/u-boot/d1a8bab8-4d88-48f2-9ddb-89e8c0e323b8@gmail.com/
[1] https://github.com/openwrt/openwrt/pull/23231#issuecomment-5972395785

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
