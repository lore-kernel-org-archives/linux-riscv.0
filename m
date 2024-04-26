Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873E2C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 05:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fK51yXUahgfEIWc+dQjeanctHVXMifNtOCb2tw/YcE=; b=qi5ZX13W1tTMUY
	xdXtKm0AUOaTCCi1IRL4VGApSk3/UFPoDy2k91MsIIg2jwLOdQFVBixuy3Ew33/+EG0oclS3FgPBI
	rPyFAXwk4mBX0yb2SawbUNeWXqwkdnDH74GK9Eo5TrIvfwbjU1T6wz18Gq1GlYf30DY4DEqq+A2UQ
	jw/BdCtMwey3gX74Dpels55pzriD+uE6KXx9gZqJXp/UIHetw7YEXzlR2zzsBeVvX9vskbf8HowUJ
	Eot7YEMQm6qR8x/nzT8YsHtzmL+UTCQDnfPocEqCbVcKeFnLEns/FRcF1f4xFAPXU/OxxAquGLeRy
	+EIUnHT896eb8Zjsv+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0EHM-0000000BBtf-3j4v;
	Fri, 26 Apr 2024 05:37:48 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0EHK-0000000BBs6-1TZG
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 05:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714109860;
	bh=GKtOWhg2ae+RlxbYZGtFto0YazT0Bul5AcJEj3TSpjM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=lSLZZ6YBArhCkS2XwPabXQWFbq4NQsfvcF/E1vM0/hLYuOipiz4pkPMgyfICwgBJ4
	 +4RzM37OQoBQeTRFPpb8SFTQ4bTokD8+ljlCHSR5VNa6MKHB6OqAvDw1S3xyf5kDWB
	 QH7UM0E83JJ+8w0p98Ac8d7pb3VKdUpKMDAqk59JL2gRX6ltGcciHrWBgykLWj1CQ4
	 NZYXoajm36CQAJjcjO123qrdJ8BMwuCZaL3RkcRpBFx7YLbcSbQrL76sca7VL5YkPQ
	 1Dbw3IiDqxsCViexavGDbodgz/HZ/p21Vnks5KoHrBptymAg8QD4BHu0q49eh3ZrDT
	 03ocGxFDvaltA==
Received: from [100.113.15.66] (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B8E7D37813A4;
	Fri, 26 Apr 2024 05:37:33 +0000 (UTC)
Message-ID: <e6ad2921-4da8-456a-8a31-a1e704c06329@collabora.com>
Date: Fri, 26 Apr 2024 10:38:04 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: selftests: Add hwprobe binaries to .gitignore
To: Charlie Jenkins <charlie@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240425-gitignore_hwprobe_artifacts-v1-1-dfc5a20da469@rivosinc.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20240425-gitignore_hwprobe_artifacts-v1-1-dfc5a20da469@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_223746_548608_34998DFF 
X-CRM114-Status: GOOD (  13.22  )
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

On 4/26/24 12:58 AM, Charlie Jenkins wrote:
> The cbo and which-cpu hwprobe selftests leave their artifacts in the
> kernel tree and end up being tracked by git. Add the binaries to the
> hwprobe selftest .gitignore so this no longer happens.
I've been posted comments on patches adding new tests to please put
artifacts in the .gitignore. But still people forget or don't know about it
as .gitignore is specific to selftests and they aren't used-to it.

> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
> Fixes: ef7d6abb2cf5 ("RISC-V: selftests: Add which-cpus hwprobe test")
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  tools/testing/selftests/riscv/hwprobe/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/.gitignore b/tools/testing/selftests/riscv/hwprobe/.gitignore
> index 8113dc3bdd03..6e384e80ea1a 100644
> --- a/tools/testing/selftests/riscv/hwprobe/.gitignore
> +++ b/tools/testing/selftests/riscv/hwprobe/.gitignore
> @@ -1 +1,3 @@
>  hwprobe
> +cbo
> +which-cpus
> 
> ---
> base-commit: ed30a4a51bb196781c8058073ea720133a65596f
> change-id: 20240425-gitignore_hwprobe_artifacts-fb0f2cd3509c

-- 
BR,
Muhammad Usama Anjum

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
