Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3132DD637DC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 03:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHtpEfHl04/9R8lgO5YuCSkzxnIl+7KeZQ9Yf8ybOIM=; b=TwJGTBylTYDAsb
	nkW81cYYr7GNZyFEl4aFhqWOvW5h+vfZughqlQtXkvDESRxPiP0OGtlsptzrl/rUX1Ue+n9qlYMDS
	+F+Gu00sd3b+DOfzTfqm0pyr02KqTUCu8bDoslFF8qDF9naMvR/XrzUC7x92dT760Lq0xBCyXrlNn
	ibDb5HpCJ0Ekihxwd+GHnKaPrT5N6tRiE6UFjWfkMDa1JUrfN7q3Kl0ig50d+FL8q2f+Zi6tnzqhg
	tgUnVUHLYQ42TSaDsXWSIQQWByU0B7sJvxtE9HL4YDId39y6h0pFPTQqlz+ya/5l7Wu+SFpimGpjp
	/6C5s7v8KCXieJ2xc+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQWy-00000008fpL-1dNE;
	Thu, 14 Nov 2024 03:28:28 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQWu-00000008foR-0pVy
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 03:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1731554897; bh=x3rqSVs17z7FLCIDeBV31FD0qTwySPyh5yvySCRhr74=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=vmN4D4P73SkIz+Qvcpb/x9nk/CzogLJ1u84bf6rY1MaOoS+k5ZqmhauTBVdC7FjwY
	 jtrpeypjk05IkiRlZi+kJ1SZAbctaFrgR4ulKoVaTekDdu283hc2oL8wb8rscLbQ7g
	 hYlFuZCHZkLrODsLjzjamexBywESi8yY8kNNu0JM=
Received: from [IPV6:2408:8207:18a1:fd2f:e457:528e:9ee1:6f68] ([2408:8207:18a1:fd2f:e457:528e:9ee1:6f68])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 6AF9025D; Thu, 14 Nov 2024 11:26:47 +0800
X-QQ-mid: xmsmtpt1731554807t0kuak236
Message-ID: <tencent_6A95637042401AD5F8BE05C7B4F11CAD7009@qq.com>
X-QQ-XMAILINFO: NWEwCzsFJJ7KjNbs5dBDITIAOft8UJoS2NDzV0IcW/t8PCPBoX4G5IS+s4JCw/
	 oLp82skEtbwCt2kjpR5iq6i+irEkJ3A142J0h5mg4nJ4DIG5CoKtu66ZMx6iwhqqvXmpfH/fmM8S
	 fncaO2fbGSxpYYdBxUFCCFGIf/oBr1C3ERhE+0LBJUuRC29/OHCSINpabUBThX9V4UOyLJtr1n8V
	 ksGCP5wVVRXPXGNQ3QP2BOfF2NWAgT5ma7lKeM3m7vguTpUeAsArcyiR+nPMtsoRqPaSvF1XxojA
	 jqgZirNmg5QSwyFaimBsKyiG1vIdLSWMd9eUw634n9SrKh5SMwTecHo0fHoNGTS7paNm7E1yDri9
	 b2vRkGmAH9jvvCW8+3DU28G0A4XUVKl/yO/QHm2MkC/9r7PROgzuyU7lpMu6fZlqVAdgI4Z1Ksjj
	 thwIN/q27cztBkfiguXXkNRUAtNB5qZOvwbOJrKUg+cOOZDThkUTU0owFAujxjL4/LWZiHYy5+he
	 GnSnRbecspkb6Zc/mExLQWFlAtupX5mH8ldLXm9jgV234x0GTd1EyHOdAnurqEpcHMISY5qk6rtI
	 zjJwEtaSqnQ7aH39NO7uhcCALe3i3C1gfgE5v6ceDcnj5bGmkLBvMtb3DdCQxoVWdizH7p23MkxP
	 Ipg9gL0bKkGuSJ8astUJ2gboPyyBS4JgjVpv8eRnJttZnF1H/0JbQvrnS7Be/C3LPYiCN/G7y3yk
	 YNAo2ih1TxcrajuaUsfOSJSy4fljx25L/wk0Lfmo1wdTS89TANzQxraN5rCWbIj1TokrRJN8oEd5
	 YGSxqZybAsayAsHuGM1AVIEaZ3pxI0MIGL/eWj3JJHF6KxUqoMjhIsmaMuhP0ehPr/y1/Udw80Uu
	 1I7k4syqBsOe1Ln3oB0tJJTiy4YU3GzU5YNJczS38CYpeCCH+di3Pr+mmh7hBFGUcsmH+eNrfu2V
	 Epr9F+d1uuNETdf7tmfxG2o0idkeem8liMMVkEMOeYn+Dl1Y1vfpZMpcmglHUXVV9xciwFaO97MO
	 1ITFYzJtXtyyMkiWRN
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-OQ-MSGID: <c00e4a8d-586f-408f-85a0-e241eaee090d@cyyself.name>
Date: Thu, 14 Nov 2024 11:26:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/14] riscv: hwprobe: Add thead vendor extension
 probing
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Guo Ren
 <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>,
 Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
 <20241113-xtheadvector-v11-10-236c22791ef9@rivosinc.com>
 <tencent_5B500856E30E1FB920B6B68D6315EE70CC06@qq.com>
 <ZzVoQi6D0U30p9sg@ghost>
Content-Language: en-US
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <ZzVoQi6D0U30p9sg@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_192824_811440_B3B7D630 
X-CRM114-Status: GOOD (  30.27  )
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



On 11/14/24 11:02, Charlie Jenkins wrote:
> On Thu, Nov 14, 2024 at 10:44:37AM +0800, Yangyu Chen wrote:
>>
>>
>> On 11/14/24 10:21, Charlie Jenkins wrote:
>>> Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
>>> allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
>>> vendor extension.
>>>
>>
>> Hi Charlie,
>>
>> How about changing the name of the key from
>> "RISCV_ISA_VENDOR_EXT_XTHEADVECTOR" to "RISCV_HWPROBE_KEY_VENDOR_EXT_0" and
>> use marchid to identify what the vendor is, each vendor will have its own
>> bit definition in this value. So we can avoid adding so many hwprobe keys
>> for each vendor in the future.
>>
>> I proposed a commit here: https://github.com/cyyself/linux/commit/36390645d85d1ac75dd71172f167719df4297f59
> 
> I actually originally had this in one of my first versions of this
> series but was convinced by Conor to change it. The problem with it was
> that tying vendor extensions to mvendorid means that it is enforced by
> the kernel that vendors cannot share vendor extensions. It is possible
> for vendor A to purchase IP that contains a vendor extension from vendor
> B. This vendor extension should work on platforms created by vendor A
> and vendor B. However, vendor A and vendor B have different mvendorids,
> so the kernel can't support this if it is tied to mvendorid.  It could
> be solved by duplicating every extension that vendors have, but then
> userspace software would have to keep in mind the mvendorid they are
> running on and check the different extensions for the different vendors
> even though the implementation of the extension is the same.
> 
> The original conversation where Conor and I agreed that it was better to
> have vendor extensions not rely on mvendorid:
> 
> https://lore.kernel.org/linux-riscv/20240416-husband-flavored-96c1dad58b6e@wendy/
> 

Thanks for your explanation. I will strongly agree with Conor's opinion 
if the feature bitmask does not exist in RISC-V C-ABI.

However, as the feature mask defined in RISC-V C-ABI[1] uses the design 
depending on marchid currently, should we reconsider this key for its 
use case? The current target_clones and taget_version implemented in 
GCC[2] and LLVM[3] also use the bitmask defined in C-ABI. I think if we 
use this key depending on marchid, to make a key shared with all vendors 
will make this cleaner.

[1] 
https://github.com/riscv-non-isa/riscv-c-api-doc/blob/main/src/c-api.adoc#function-multi-version
[2] 
https://github.com/gcc-mirror/gcc/blob/8564d0948c72df0a66d7eb47e15c6ab43e9b25ce/gcc/config/riscv/riscv.cc#L13016
[3] 
https://github.com/llvm/llvm-project/blob/f407dff50cdcbcfee9dd92397d3792627c3ac708/clang/lib/CodeGen/CGBuiltin.cpp#L14627

>>
>>> This new key will allow userspace code to probe for which thead vendor
>>> extensions are supported. This API is modeled to be consistent with
>>> RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
>>> corresponding to a supported thead vendor extension of the cpumask set.
>>> Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
>>> to determine all of the supported thead vendor extensions in one call.
>>>
>>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>> Reviewed-by: Evan Green <evan@rivosinc.com>
>>> ---
>>>    arch/riscv/include/asm/hwprobe.h                   |  3 +-
>>>    .../include/asm/vendor_extensions/thead_hwprobe.h  | 19 +++++++++++
>>>    .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
>>>    arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
>>>    arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
>>>    arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
>>>    arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
>>>    .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
>>>    8 files changed, 88 insertions(+), 2 deletions(-)
>>>
>>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
