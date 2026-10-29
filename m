Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA12606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NEFMMLb2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F/m37bxI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	In-Reply-To:Mime-Version:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=SOm/ojn6gXGppeJi54JBRvkUO71nz5WptCKh5P59g7k=; b=NEFMMLb205WucX4YLDv6SIEfZX
	UAPUyuJdjfd3kmr+PqtpEeP9J8zrPoxYDmeyUjK5RaGJjHVfuZVBBUk7M+RMPRAGVQiGOYzZIdOKl
	9NEHInuVrEGuBGFnilhnfS0kbCRZoGUHKKP7rBSfwhkmmJtc6LkB586NV54s6O++h4sHK4GD5e7sO
	TNcOMB7aPMADyle8CZwTlSl5U4X1VMoaL+TVRZ2JsuuT69Cy+oK2WnKDJw/ln7C6AqRtxZWcObn9e
	G1rVD3qy00GCO4BTER29nJr1GNR6noaZVvL0kGDfqDh+rNJFlVT42E9UOQaX3Eml+TTPtDTiO1rbX
	dTCSAMaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLI6-00000008h1M-474W;
	Thu, 29 Oct 2026 08:15:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLI3-00000008h0g-24Cv
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 08:15:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2171548a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 01:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793261714; cv=none;
        d=google.com; s=arc-20260327;
        b=GBLMzhHgjX/k8yScove72Lu2/uyB3xF/YsQGuKO/oSXJ0vmOtBcC/nkyCT19uNcntU
         RKakjVA9a7YhivUckf2vr9/Ae5gbQBmemi5hth/KoygOyLVLgx3vRnJbU54Tj0Gddu9u
         DQh9UyOV/hd6KuErN7k2D3JZYHYM+8ev8aMDPWIjnxQKs8EzWqtFku+Bt+pD2wltKPms
         hI7tbPdCJViInlI5W+GMacEYsCYemxJRt9D1Z68hmxre80K7GDRFrAt2CkQb7iNNxSaq
         Wq4tyI4lhEP8Uw5TOqZMRDg5BkuJqsOIB9GkqzGu4AeFx+IOCPMXMmTQ48iit/bLm0JS
         4Kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :user-agent:from:dkim-signature;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        fh=z3qQxdzQxUK6GseSrDXx2FtOk4hdEZ3HLnU1oYTlF3Y=;
        b=ADvP4KWxmx50rEH5iSbt3H88I1GBNOXPLhu1wxKyDJFKwruuQ2CUivdg3Lafh7tHW4
         hiPBifpitoLGLAvIuW4YDGSkiawXsXN9IDKTfriaqi1nkWGgtPueeC9ZWp77cLk6TfC6
         MSouzUHqKiqiZiq+Gj06WWsbt27YLEg0kOZfFgy9S2+yT/qToFk6842zHxQv2skKZ2GP
         oTaljU4VYMdwqx0/+bB0B/2Wu0PLhAROfRxmpaLu/8F2s68V727+xVmgpDwQ6Q8/QyOw
         X9IS3aHhwY74kx2vfglTus0dRGpX6F5m9xax72rBBDPs89EJyVkWtt4DqgHLv+nnVpCA
         KtqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793261714; x=1793866514; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:user-agent:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        b=F/m37bxIw3ccJKp69N0kKcdsT27MdA4mHngYp7+94wUnq476f29WzE7HIK529dBM5g
         n7YUbAIpDmPO6NH+/bPjm3OLMG1yG6tNfcZ0t/qS7zwEh9vuk1ed5kyptuSibdEaICJi
         SYfxPD7GPDNsg87g9xYV1mYoj6hWIa2nzs07Mxxha+HDTiJpf/455hCsI45hbnnz9OtG
         Xbl6JUA40JQkVxqNHT+W6wbC7FD+300ngSAoDCki6Ja4n7onY10EWVPvY0dXcLw3Gb6J
         4ZaqBGMUPywpmqz4WSLB8NvalZQvnmXVbPg1+nXsyeplC2bV9bQIESz5MeKxuF5UJ/uC
         un6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261714; x=1793866514;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:user-agent:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        b=tS7tAGZGGTlo8tTwH+xMJfVg6KNbR0cNWRQzt3Mskq5fdIZ9xiYXGqxpczpMGfAUzh
         eoP1vhTzS7aBHpP8Uh5EqeEfG/zHTyLOeWlg9z2F6RI8KozYremmbS6QNvYYm9OmhI2i
         uCa/Jbf8r4rE3YYQD8Ga6HC8qcddwuwizT1jx+D3yAs6e+DkFSN1RZHlUuOanj9RUeCG
         Y4qJClaDBPoM1a3GIyvsOaNfNcVTHRTLu6zPhvUASpTc9tj9MIw4bEDarfDmJzd1A/md
         jDkhm/JFp8aNI98/EY/SHAIfSx3Z5AssoR/U6HT84il3HTIA6kNVlJ7wt3UP3m2U5iPk
         CHUw==
X-Forwarded-Encrypted: i=1; AKwUvBxS2Mn0Ys/RXhmDeiyICwxDPlFmK4cEaO0opoOC+UAhNHfofCOswEP9MKq/MV1o25krzwKqDDItXTPHvA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKDshpm6LGGO7Sa93faUgS5h/Yao8iVqUIq8rUUXkIQek/3edfL
	GWCIrcO7KkJB+KyTNA/HuTm9y7PIozp5gmTMt93qpmQlq4nZBJlzMZKcxaw4wtuBd+0mSb7tmGH
	PSys6mbcYDbnMoHd6PpwgrIOr9OXPKKb44Gzg3iO72Q==
X-Gm-Gg: AYBFou12NjUzp8bdop+DuEs2+y8UP+frnVrfl6dXdUH4qG3fV0+E8iuaEooeJ3eCgtD
	b9tmkAXDxExSJIGWdi2kWtTeJBUFmzqZS9TAvvXsQgGMpDlz/MXOQBPqPWl4PPoVnZ4k16+DfzH
	XENbH6UVJZaN2WEUb2PFCCsgkGhhD9TOwFhYA1dkYnvxabNqiO5ywNOSuA4NhQ+/L+jikqDzqJR
	8LBCVWaxfLoixA8uXH31rzHu1hNHj6gMibpX9EGYAIUhN3ARsI2uA5gguaSb/tmsjFaCRd4DNpT
	uJrYpQDPOAgeKyWO3wzDCDloavq0L7hDU7SjBzVq3q35p86YbiE7WO1g5YVRW9Qm6l+GaXnYHIZ
	HfSYiWidqgEO28Nr4emITkxZ4IYmxkC/q4jSPHQM9PUeRz8Sk1fJD9u5RhQ==
X-Received: by 2002:a17:90b:1644:b0:3ac:bc3d:6fe5 with SMTP id
 98e67ed59e1d1-3ae57df3d9cmr3792452a91.7.1793261714053; Thu, 29 Oct 2026
 01:15:14 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 01:15:09 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 01:15:09 -0700
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
 <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
 <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com> <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
In-Reply-To: <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
Date: Thu, 29 Oct 2026 01:15:09 -0700
X-Gm-Features: AclHuK_f9UmrKyQEn9kevLn5RZ0DxR6jXXwQ6CxrknwZt6gPcFhXWT1BqyQH4Dk
Message-ID: <CACnXVndTuZd8jyVG0=KEq1WicQ4iCA22_TkOnSMyrtbTD+ybWA@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Paul Walmsley <pjw@kernel.org>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_011515_666671_EB03FD3F 
X-CRM114-Status: GOOD (  15.01  )
X-Spam-Score: 0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Himanshu, Paul,

On 10/29/26 3:09 PM, Himanshu Chauhan wrote:
> On Thu, Oct 29, 2026 at 11:32:36AM +0530, Anup Patel wrote:
>>>>> [...]
>>>>> Paul, please hold off on taking this version into for-next until
>>>>> these fixes are included. The rebase and PMU testing are useful, but
>>>>> there are still outstanding correctness issues.
>>>>>
>>>>> I will consolidate the changes and post v12 against riscv/for-next,
>>>>> with an updated changelog and validation results. Let's coordinate
>>>>> the next posting to keep everything together.
>>>>>
>>>>> Thanks,
>>>>> Zhanpeng
>>>>>
>>>>> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
>>>>
>>>> Regards,
>>>> Anup
>>>
>>> I'll post a focused v12 before this weekend with the immediate
>>> correctness fixes. Further improvements can follow separately.
>>
>> Linux-7.4 merge window closes end-of this week so your v12
>> will be too late for it hence I suggest sending incremental fixes
>> separately.
>>
>
> Hi Zhanpeng,
>
> I agree with Anup. IMO, SSE as a feature is ready. It will be easier
> for you and for me if the patches are merged. It has become a pain to
> send revised RAS patches because of the dependency.The issue that I
> identified can be sent incrementally in coming weeks.
>
> I would request Paul to pick up the SSE patches now.
>
> Regards
> Himanshu

SSE v12[1] is ready with the correctness fixes discussed on the v10 threads.

Himanshu, I checked your posted RAS v5 series against v12: all nine
patches apply cleanly without modification. V12 uses the same
riscv/for-next base as v11, so switching the dependency requires no
changes to your patches.

Paul, please pick up v12 rather than v11 so these fixes are included
from the start.

Thanks,
Zhanpeng

[1]
https://lore.kernel.org/linux-riscv/20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
