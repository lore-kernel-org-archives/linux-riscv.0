Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D6ED15D8A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiArfI3RN3KsoUidY3H0A+P3qatYOOnWuHfRMWSLOaw=; b=qIgUJB489j7BMaGBYR2uqLdmWq
	BlPMLEuQjHP5dLgdXBfxlw9Xr8Cp0NQ4hr/dksGlCm5AkcjRqXvGcmeCswYisEB+sPOwuEPWEkrnN
	uRrPz9bXkygKlq1hDk5TyO2rdzWVKCe/KrRToIfuuVntWVVFPDtMZxWIReCnT2pHFeHsTHJRRjP0u
	k2mGSWHoUDBmaui/KFhzawQ8tR4DpluGL+6U9Pi1L6CZWNYrKeg9kUU9mqSDpYEQ/Nu6lbDYtRfSY
	LuD78fp9SJCxfPdoLMQSnmFqT/4MPrqOJDWQsoDZDe7050/Fj9Ci47xC9u2IJFPCYT4ouAnQYNKtY
	vUOqDF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s94-00000007NGq-0O7v;
	Mon, 21 Oct 2024 13:08:26 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s2U-00000007Lti-3hfe
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 13:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729515666; x=1730120466; i=deller@gmx.de;
	bh=S31lOP+pBSP5U2YXLz1j7FzuDouUQIPICU9YpCJx6pM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RrUyksJpseZgPuTP195pPBxQPiioi4h8ADAWE5o54SiaTh0TVbBsiMwky5w97p+m
	 DxrjjPAO6RGNi5LpYioKl/LRZ5KjtVjvczMfzFtgCaa7fN9y5WyC3h5NB831JRvK8
	 wH6Oo96mUWZVr10KJj/43tEYW1YNTJnmySoF4Xo08vZ36QVHTZvho/sd7icvDb9j6
	 xoi1aQebK4RAkJqbUDYr55yXlrJoxMje3kUB9FJfEH5dVy2WHwkHL5ElfNS12ucQS
	 5nOUJfdsck7dLspfcKtkcwPiuOkDf96MATT64ybjnK3ET/yifgZF2qV49tQkxAqmp
	 E2C4yyCPdh/JE8tL4Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbRk3-1tegp63y2r-00jD37; Mon, 21
 Oct 2024 15:01:06 +0200
Message-ID: <31b8ea3b-f765-43c0-9cee-49bc13064f04@gmx.de>
Date: Mon, 21 Oct 2024 15:01:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 3/5] selftests/bpf: don't mask result of
 bpf_csum_diff() in test_verifier
To: Puranjay Mohan <puranjay@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller"
 <davem@davemloft.net>, Eduard Zingerman <eddyz87@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Hao Luo <haoluo@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Martin KaFai Lau <martin.lau@linux.dev>, Mykola Lysenko <mykolal@fb.com>,
 netdev@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Puranjay Mohan <puranjay12@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Yonghong Song <yonghong.song@linux.dev>
References: <20241021122112.101513-1-puranjay@kernel.org>
 <20241021122112.101513-4-puranjay@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241021122112.101513-4-puranjay@kernel.org>
X-Provags-ID: V03:K1:auOFnIpJiEAk5Fa+WnLI7piJej8lx32XA4spabM23qTpWruFFW0
 x9RKJMkeWcfOznhlofvKhgm9WtmKsFg4w84LUTLBA+1Cyamc0nrgV60EhEjgr19Fgatv0ET
 gPn4Rhjf4UO2qnoK0tLfKBsmXkteb6Zm5n025m/axF5Bt4QbTksjm2VKrZJD7F8fixdp1Bu
 C9ObDiS11JU4Nvc5DZC4Q==
UI-OutboundReport: notjunk:1;M01:P0:j0s9SkIkIbM=;zhXl8zxLSqKXpXKKLXyaonLGtQ+
 LEYdrhsYbwyNnBjZIMn8HZtMJxoCIkPzzUclL5So2coka+o1of1cN2v9yt41wzNpkVdnUX4xX
 u6u3gZfxkIHhe8f+XE6FYF5T0ZXiAD/e7Ux5BMt7B1UxF5HdgwnOHii3R27zcoFISoYtPX+2y
 aQxIx02Yx/Booqmvb7pHgfq1VyeqVmU8JDq3pqhr1rximZOCRFNvpRq5WoXtXV48JlQSr1YSH
 Lzlb+pBOU1jrp/iJgBsORGnwsPEFhNMz45e+CxVue02ZssG1ZbpFdUmGK4th9tFtiamrktX9l
 Ed87q0CmPrKUTzjUi/oA+MD8PsMQ04tGWF9nkuUsV4TPeJO78pdHixtEKK25f2jrb28S4Otou
 RTMv27VNzr+bdaUlvYGgcwkSaIoxp2aGQVG0MZZh9Pjhujtu6BcM6sYn3xQWkdNMCXCSjVCEw
 GmSywMchy0yd1vzIVrCA5AuZr/99jYAIKwlaJp39EE8817GG54jIKk0x+f111P1o3HGMJKc65
 dN9vWRHfd5TNGJ/118t+pmJnlUtnQbvWIXYJnmxLUmqsD9FRA1SDF4gqRRehAAzZTFRbsm6tW
 XVIpFUcHT7zikq4NKnEItqVExAzS/6zVS3+N/ZjVKPC3vwEUsq2w9hJ3k8cK9Sl/us96FQAWQ
 2gQAw33Sb7Q4LA+4YCVRz3WVz/9hur2fWWqiSi/AVXxno8yRZme+w9bJAjDDdj9D43RYEV/7B
 AxuCIo18ZP2DWAo+yDDMxiDlsJq7ECAzlXpxWyFXJpvur/OVUPi0K2/0nJkeayDh655gXPsb1
 NpwICZ2XMgePgnH0CBN1eJUw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_060139_230240_5A47FE1A 
X-CRM114-Status: UNSURE (   7.95  )
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

On 10/21/24 14:21, Puranjay Mohan wrote:
> The bpf_csum_diff() helper has been fixed to return a 16-bit value for
> all archs, so now we don't need to mask the result.
>
> ...
> --- a/tools/testing/selftests/bpf/progs/verifier_array_access.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_array_access.c
> @@ -368,8 +368,7 @@ __naked void a_read_only_array_2_1(void)
>   	r4 = 0;						\
>   	r5 = 0;						\
>   	call %[bpf_csum_diff];				\
> -l0_%=:	r0 &= 0xffff;					\
> -	exit;						\
> +l0_%=:	exit;						\

Instead of dropping the masking, would it make sense to
check here if (r0 >> 16) == 0 ?

Helge

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
