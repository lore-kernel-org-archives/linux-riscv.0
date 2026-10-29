Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB0B606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rV08nFOI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=de+90XGj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:From:In-Reply-To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=OkD1FUeqzxFVxrK2ACNuxkVlpXrG5fVlF6YnFKdneQ0=; b=rV08nFOIgckVZgElgRTjLxoTnr
	ZS96QV2sUTvebGDVbstVKXie/LcofrcKAWWFBmngV9/3KNxQHc+erZqazzuuthoh8cW8Rp7sECO0r
	VBjCpO7feRUmjSZcJ+k7x41Jbcs53n1ykeX75EI5/IKeQJXVDznXe87RUMTuIplzN7BBnwpCfX3TK
	4U9x2hvZAKgBGG4S+D7lqPqyBJFF5fDftoW35bA8A4RsrziPiQOsXRkAD4p+70U7MbItgBvAYdIln
	9bl40vkxWeImBZqq3Lag4kpg/+rhONXK/pa9Jp4t/ClfgdBwP2yJMoDfWnJ0TSD6m78oOMLX7g2bQ
	CougF9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMROg-00000009YiL-07fZ;
	Thu, 29 Oct 2026 14:46:30 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMROd-00000009YhV-1Wdi
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 14:46:28 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3a75f960be4so17463671fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 07:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793285184; cv=none;
        d=google.com; s=arc-20260327;
        b=NEEqSIpSr3i7zPSX1GFQghPZ/BD8biAngpbRwNC4pzxVZ93iKNrhXyNMQxsTNl1QbP
         c1SCOBlG+hIYJQNWjfMARoTbDvS7LAFL0QVlqiPhNWBb9MapbyzZ8ngs2xkEF3y51bO0
         j57nVMSDVqW3pvPLOir1YPTBr0N/zT14DKEkEMB6+sHtQFILuXPiHeVaRh1JTZrwLnsF
         PWLEUpMXfR+cUtlzgqGpZy8KNTYvgLsfhcUz8UAxrQOGuDDRF/m4ocOZwzUqn3hLqP5+
         27tXNQH/WlHcgS6uNXY9llI1hdUmBpfBA2/YQT9RkuiOMo0Mfmt1vtp8kpFtIDeLGjkT
         t+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:from:user-agent:in-reply-to:dkim-signature;
        bh=h2unH/KWXHOOKEcsRl7AiS4RPP1kGzJaZEEy3NWnszY=;
        fh=RqrX6AzcQv9izr9qA6gHyjioJkEohqpFhqqX0HzQ7f4=;
        b=szGwjcnHQDTMzC3Lg4PT9/tVURFFzU4j7OyveRh7ksXEo8CwbfHNifsUHeQDNiC+hQ
         3wkoAb9X1yp+g4PcxDpqLh0UY5zggqevYwQ7RIkvHN0IBLiEhvh7viFpx6nApjLEAOtH
         I596MP9u4SrUiMseSirlTXewJKcdC3kBiakwu3Wqm28Vmvwuu/nuLfyb0fkGJpqKCFTe
         D/YponJ2o7kyjO/HGKoiZzPtm56iGlvQmfyc2UoPYIpwomchIkqzxPPghPGjYwlGEQk4
         7u+wxdVPsuhrKHZUTS8gae865wF1XLLqNMJElQOzpr0J6yU4vDZMJzhfNtttzBPO60gC
         8wBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793285184; x=1793889984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:from:user-agent:in-reply-to:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h2unH/KWXHOOKEcsRl7AiS4RPP1kGzJaZEEy3NWnszY=;
        b=de+90XGjkPPLBgtkqJMrPCTcr9/V59CCV5O3nV529vilT89S+gSSnaqx/GumEzuwEl
         M+Yt0feGzzswtDV5zAI1cl2VDecGe7ppllYPEXJs0DuyzMGn4sMWmZqN6BIoG+mLEPWN
         7CQ4Z/u0H6ELRBS6svzlev3OIAPcEz1ZXewXZ2wrMejVD/9xF/RaBW9tOcgNMy/6HatP
         UrwqyVRSjtBOznIDf0aoyXIYX0vDS888mSFJajRtV9VJl5KHmXkZzm1uGBsYyCUrecOi
         JtcD9ULp/lH2r+Dd2yk9mbGgLX6QC2f2UQ+lAi6ueaudOqhaCt0NRwCFA8aOXoFlZkoP
         47lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285184; x=1793889984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:from:user-agent:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2unH/KWXHOOKEcsRl7AiS4RPP1kGzJaZEEy3NWnszY=;
        b=zEYM2rLbNKUvXwefAeY9LK52kr2zlKsYm9OntImFGoMVm1R2QbdisN6DYT9/i5Sjpy
         rywI6aIjfxMwB4f9cNNnhOJeqiH++DePvJLo0wMchHarq4ssXWEPWCQFygLYulP6amWK
         jVJ8yAPWwVkffJ8AbNvxFb55ti8jzVslxg6HEUqrbedXLoR1a7h/37lxhn/EMQQ2ScHD
         AiHVf7V78/36mbh2xYSFbsg0dk7PPmZgvUjTjuBVWNxOV0u1wtLAszGqRpjxkIo9ed3+
         iSybQ1hMtmNnC86pIEyJd6JTXdEtGDrD6Yjcwi2jE6IdgKwqLp9HSNpIjqinOv+4zW+n
         VZHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7Gd2Vn4zQGL0mkjjV84I4P3FyNpFVMi1Cwr1SpQ2ioIy4W6d5+3zuB9KD/tyiSeaCjit7vcyHdKtLIw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIIMT+SQyBdOddCx9FVCMmtNssfeP4t7253PecFuJmRmRFW5QIG
	7sK/FnF2WBkQ0/CfN2mjmKQIQxinqpcEVvMts5ZP95NNVFoTZmc3QKxIyoAgyQoWekJGqayVzKz
	7pMCiNQ3WVvCkllZPNQIiZodKSAgZoCppL4miGnEQBw==
X-Gm-Gg: AYBFou1iDN1sBV9yy2sA7u+7X6brG13gImBi+cF8TUUaaPEXsLMYXLQ5fz16DhaZUHI
	PDw4DIKf3Uef3C48f5i98ZmIjwlac5zi4QZfy8Xm2JnbXrEO7rBRt37oVK0uIxyFkNMIImyx79Z
	PsF5YXudQAzIjV9lW7Z5YUAgvXiIQeZoI4twNsFsgLBjqPg9OYetDNs2d72lbALrM+8alXonEvN
	4362MY3KDbEpWNiRQhqbb8s+PjCz0r5ag3O8uzO0OmkCX1xmuaO1enGrZu3qrwjzyDiiu2vA6Cd
	ObEJ/xjZAR6fHZzozw4Ak13O7/pnY5jusOuHxAWUuddKtmCtVCh0dGhf6/NkT0jmWx/Vy9R5f8Y
	aZg9vflk6Wu/OJoPHPMbZYILoSnNInxz9WWbs
X-Received: by 2002:a05:6512:39d1:b0:5be:5394:162d with SMTP id
 2adb3069b0e04-5bfcad0187bmr2218416e87.3.1793285183781; Thu, 29 Oct 2026
 07:46:23 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:46:22 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:46:22 -0700
In-Reply-To: <auNOqR9xm3XMJcFN@hu-himchau-blr.qualcomm.com>
User-Agent: Mozilla Thunderbird
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
 <20261029074853.35467-3-zhangzhanpeng.jasper@bytedance.com> <auNOqR9xm3XMJcFN@hu-himchau-blr.qualcomm.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 29 Oct 2026 07:46:22 -0700
X-Gm-Features: AclHuK-zJlvKOh1yAp6a7dQAN71cSzK9kF4Z01Nrh3d3tl8aCmmywHrd8FEXpMA
Message-ID: <CACnXVnc6QgXfGjNWHGD_5_zNH9hjZ-Fartj8ZCwmtHDV4zt7cA@mail.gmail.com>
Subject: Re: [PATCH v12 02/11] riscv: add support for SBI Supervisor Software
 Events extension
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, yuanzhu@bytedance.com, yang.yicong@picoheart.com, 
	yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_074627_669268_5E99A614 
X-CRM114-Status: GOOD (  24.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpPbiAxMC8yOS8yNiA5OjQ4IFBNLCBIaW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+IEhpLAo+
Cj4gT24gVGh1LCBPY3QgMjksIDIwMjYgYXQgMDM6NDg6NDRQTSArMDgwMCwgWmhhbnBlbmcgWmhh
bmcgd3JvdGU6Cj4+IEZyb206IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4K
Pj4KPj4gVGhlIFNCSSBTU0UgZXh0ZW5zaW9uIGFsbG93cyBmaXJtd2FyZSB0byBub3RpZnkgc3Vw
ZXJ2aXNvciBzb2Z0d2FyZSBvZgo+PiBldmVudHMgdGhhdCBtdXN0IGJlIGRlbGl2ZXJlZCBpbmRl
cGVuZGVudGx5IG9mIG5vcm1hbCBTLW1vZGUgaW50ZXJydXB0cy4KPj4gRmlybXdhcmUgc2F2ZXMg
dGhlIG1pbmltYWwgc3RhdGUgcmVxdWlyZWQgdG8gZW50ZXIgdGhlIHN1cGVydmlzb3IgaGFuZGxl
ciwKPj4gYW5kIExpbnV4IGJ1aWxkcyB0aGUgc3ludGhldGljIGhhbmRsZXIgY29udGV4dCBhcm91
bmQgaXQuCj4+Cj4+IFNTRSBjYW4gYXJyaXZlIHdoaWxlIExpbnV4IGlzIGFscmVhZHkgaW4gYW4g
ZXhjZXB0aW9uIGVudHJ5IHBhdGguIEF0IHRoYXQKPj4gcG9pbnQgc3NjcmF0Y2ggYW5kIHRwIG1h
eSBiZSBpbiB0aGUgbWlkZGxlIG9mIHRoZSBub3JtYWwgdHJhcC1lbnRyeQo+PiBleGNoYW5nZSwg
c28gdGhleSBjYW5ub3QgYWx3YXlzIGlkZW50aWZ5IGN1cnJlbnQuIFN0b3JlIGN1cnJlbnQgaW4g
YQo+PiBwZXItQ1BVIHNsb3QgYW5kIHVzZSB0aGUgaGFydCBJRCBwYXNzZWQgYnkgZmlybXdhcmUg
dG8gcmVjb3ZlciBpdC4KPj4KPj4gR2l2ZSBlYWNoIGV2ZW50LCBpbmNsdWRpbmcgZWFjaCBDUFUg
aW5zdGFuY2Ugb2YgYSBsb2NhbCBldmVudCwgYSBkZWRpY2F0ZWQKPj4gc3RhY2sgYW5kIHNoYWRv
dyBjYWxsIHN0YWNrLiBTeW5jaHJvbml6ZSB2bWFwcGVkIHN0YWNrIHJhbmdlcyBiZWZvcmUKPj4g
dW5tYXNraW5nIGV2ZW50cyBzbyB0aGF0IHRoZSBoYW5kbGVyIGNhbm5vdCB0YWtlIGEgdm1hbGxv
YyBmYXVsdCB3aGlsZQo+PiBydW5uaW5nIGluIGFuIE5NSS1saWtlIGNvbnRleHQuCj4+Cj4+IFRo
ZSBoYW5kbGVyIGlzIGEgc3ludGhldGljIHN1cGVydmlzb3IgZXBpc29kZSwgYnV0IGNvbXBsZXRp
b24gbXVzdCByZXN1bWUKPj4gdGhlIGNvbnRleHQgaW50ZXJydXB0ZWQgYnkgdGhlIFNTRS4gUHJl
c2VydmUgc3R2ZWMgYW5kLCB3aGVuIHRoZSBoeXBlcnZpc29yCj4+IGV4dGVuc2lvbiBpcyBwcmVz
ZW50LCBoc3RhdHVzIGFjcm9zcyB0aGUgaGFuZGxlci4gUmVhZCB0aGUgaW50ZXJydXB0ZWQgYTYK
Pj4gYW5kIGE3IHZhbHVlcyBmcm9tIHRoZSBTU0UgYXR0cmlidXRlcywgY29uc3RydWN0IHB0X3Jl
Z3MgZm9yIHRoZQo+PiBpbnRlcnJ1cHRlZCBjb250ZXh0LCBhbmQgd3JpdGUgYmFjayBhbnkgY2hh
bmdlcyBtYWRlIGJ5IHRoZSBoYW5kbGVyLgo+Pgo+PiBOZXN0ZWQgZXhjZXB0aW9ucyBvbiB0aGUg
U1NFIGV2ZW50IHN0YWNrIHRlbXBvcmFyaWx5IHJlcGxhY2UgYm90aAo+PiBUQVNLX1RJX0tFUk5F
TF9TUCBhbmQgVEFTS19USV9VU0VSX1NQLiBQcmVzZXJ2ZSB0aGVpciBvcmlnaW5hbCB2YWx1ZXMK
Pj4gYWNyb3NzIHRoZSBoYW5kbGVyIGFuZCByZXN0b3JlIHRoZW0gYmVmb3JlIGNvbXBsZXRpbmcg
dGhlIGV2ZW50LCBzbyBhCj4+IG5lc3RlZCBleGNlcHRpb24gY2Fubm90IGxlYXZlIHRoZSBpbnRl
cnJ1cHRlZCB0YXNrIHJlZmVycmluZyB0byB0aGUgZXZlbnQKPj4gc3RhY2suCj4+Cj4+IE9uIFJW
NjQgd2l0aCBhbiBNTVUsIGVhcmx5IHRyYXAgZW50cnkgYWxzbyB1c2VzIHRocmVhZF9pbmZvLmEw
L2ExL2EyCj4+IGFzIHNjcmF0Y2ggc2xvdHMgYmVmb3JlIHNhdmluZyB0aGUgZnVsbCByZWdpc3Rl
ciBmcmFtZS4gQW4gU1NFIGhhbmRsZXIKPj4gY2FuIGludGVycnVwdCB0aGF0IHdpbmRvdyBhbmQg
dGFrZSBhIG5lc3RlZCBmYXVsdCB3aGljaCBvdmVyd3JpdGVzIHRoZQo+PiBzYW1lIHNsb3RzLiBQ
cmVzZXJ2ZSB0aGVtIGluIGFscmVhZHktc2F2ZWQgY2FsbGVlLXNhdmVkIHJlZ2lzdGVycyBhbmQK
Pj4gcmVzdG9yZSB0aGVtIGJlZm9yZSByZXN1bWluZyB0aGUgaW50ZXJydXB0ZWQgZW50cnkgcGF0
aC4KPj4KPj4gRGlzYWJsZSBwcmVlbXB0aW9uIHdoaWxlIGluaXRpYWxpemluZyB0aGUgcGVyLUNQ
VSBlbnRyeS10YXNrIHNsb3QuCj4+IENQVSBob3RwbHVnIGNhbGxiYWNrcyBydW4gaW4gYSBwcmVl
bXB0aWJsZSB0aHJlYWQsIGFuZCB0aGlzIHdyaXRlCj4+IGhhcHBlbnMgYmVmb3JlIHRoZSBndWFy
ZHMgYXJvdW5kIHRoZSBsb2NhbCBTQkkgb3BlcmF0aW9ucy4KPj4KPj4gQ29tcGlsZSB0aGUgc3Rh
Y2sgVExCIGhlbHBlciBvbmx5IGZvciBWTUFQX1NUQUNLIG9yIFNIQURPV19DQUxMX1NUQUNLLAo+
PiBpdHMgb25seSB1c2VycywgdG8gYXZvaWQgYW4gdW51c2VkLWZ1bmN0aW9uIHdhcm5pbmcgaW4g
b3RoZXIgYnVpbGRzLgo+Pgo+PiBLZWVwIGFuIGV4cGxpY2l0IEVWRU5UX1JFR0lTVEVSIG5vdC1z
dXBwb3J0ZWQgcmVzdWx0IGRpc3RpbmN0IGZyb20gb3RoZXIKPj4gZmlybXdhcmUgZmFpbHVyZXMu
IFRoaXMgbGV0cyBjbGllbnRzIHNlbGVjdCBhbm90aGVyIGRlbGl2ZXJ5IG1lY2hhbmlzbQo+PiBv
bmx5IHdoZW4gZmlybXdhcmUgaGFzIHBvc2l0aXZlbHkgcmVqZWN0ZWQgdGhlIHJlcXVlc3RlZCBl
dmVudC4KPj4KPj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9hczc5TUh0TllkLVZi
VXVnQGh1LWhpbWNoYXUtYmxyLnF1YWxjb21tLmNvbS8KPj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL29lLWtidWlsZC1hbGwvMjAyNjEwMDIwMDA5LlAzSUxuRGkxLWxrcEBpbnRlbC5jb20vCj4+
IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4g
Q28tZGV2ZWxvcGVkLWJ5OiBIaW1hbnNodSBDaGF1aGFuIDxoaW1hbnNodS5jaGF1aGFuQG9zcy5x
dWFsY29tbS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEhpbWFuc2h1IENoYXVoYW4gPGhpbWFuc2h1
LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBaaGFucGVuZyBa
aGFuZyA8emhhbmd6aGFucGVuZy5qYXNwZXJAYnl0ZWRhbmNlLmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogWmhhbnBlbmcgWmhhbmcgPHpoYW5nemhhbnBlbmcuamFzcGVyQGJ5dGVkYW5jZS5jb20+Cj4+
IC0tLQo+PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggICAgICAgICB8ICAxNCArLQo+
PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2NzLmggICAgICAgICB8ICAgNyArCj4+ICAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zc2UuaCAgICAgICAgIHwgIDgyICsrKysrKysrKwo+PiAgIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB8ICAgMSArCj4+ICAgYXJjaC9yaXNj
di9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPj4gICBhcmNoL3Jpc2N2L2tlcm5l
bC9hc20tb2Zmc2V0cy5jICAgICAgfCAgMTQgKysKPj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRy
eS5TICAgICAgICAgICAgfCAgMTQgKysKPj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9zYmlfc3NlLmMg
ICAgICAgICAgfCAyNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgYXJjaC9yaXNj
di9rZXJuZWwvc2JpX3NzZV9lbnRyeS5TICAgIHwgMjM3ICsrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gICA5IGZpbGVzIGNoYW5nZWQsIDYxOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NzZS5oCj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3NiaV9zc2UuYwo+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9zYmlfc3NlX2VudHJ5LlMKPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2FzbS5oCj4+IGluZGV4IGI4YmY4NDJkNGMxLi5lMTE5NmNhZWEwMiAxMDA2NDQK
Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaAo+PiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2FzbS5oCj4+IEBAIC05MSwxNiArOTEsMjQgQEAKPj4gICAuZW5kbQo+Pgo+
PiAgICNpZmRlZiBDT05GSUdfU01QCj4+IC0ubWFjcm8gYXNtX3Blcl9jcHUgZHN0IHN5bSB0bXAK
Pj4gLQlsdyAgICBcdG1wLCBUQVNLX1RJX0NQVV9OVU0odHApCj4+IC0Jc2xsaSAgXHRtcCwgXHRt
cCwgUklTQ1ZfTEdQVFIKPj4gKy5tYWNybyBhc21fcGVyX2NwdV93aXRoX2NwdSBkc3Qgc3ltIHRt
cCBjcHUKPj4gKwlzbGxpICBcdG1wLCBcY3B1LCBSSVNDVl9MR1BUUgo+PiAgIAlsYSAgICBcZHN0
LCBfX3Blcl9jcHVfb2Zmc2V0Cj4+ICAgCWFkZCAgIFxkc3QsIFxkc3QsIFx0bXAKPj4gICAJUkVH
X0wgXHRtcCwgMChcZHN0KQo+PiAgIAlsYSAgICBcZHN0LCBcc3ltCj4+ICAgCWFkZCAgIFxkc3Qs
IFxkc3QsIFx0bXAKPj4gICAuZW5kbQo+PiArCj4+ICsubWFjcm8gYXNtX3Blcl9jcHUgZHN0IHN5
bSB0bXAKPj4gKwlsdyBcdG1wLCBUQVNLX1RJX0NQVV9OVU0odHApCj4+ICsJYXNtX3Blcl9jcHVf
d2l0aF9jcHUgXGRzdCBcc3ltIFx0bXAgXHRtcAo+PiArLmVuZG0KPj4gICAjZWxzZSAvKiBDT05G
SUdfU01QICovCj4+ICsubWFjcm8gYXNtX3Blcl9jcHVfd2l0aF9jcHUgZHN0IHN5bSB0bXAgY3B1
Cj4+ICsJbGEgICAgXGRzdCwgXHN5bQo+PiArLmVuZG0KPj4gKwo+PiAgIC5tYWNybyBhc21fcGVy
X2NwdSBkc3Qgc3ltIHRtcAo+PiAgIAlsYSAgICBcZHN0LCBcc3ltCj4+ICAgLmVuZG0KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2NzLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Njcy5oCj4+IGluZGV4IDAyM2E0MTJmZTM4Li4wZDcwYTM1YmMwMSAxMDA2NDQKPj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zY3MuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Njcy5oCj4KPiBUaGlzIHBhdGNoIGRvZXNuJ3QgYXBwbHkgb24gdjcuMy1yYzcu
IERpZCB5b3UgcmViYXNlIG9uIGl0Pwo+IGI0IHNoYXphbSBmYWlsZWQgYXQgdGhpcyBwYXRjaCBp
biBzY3MuaCBmaWxlLgo+Cj4gUGxlYXNlIGNoZWNrLgo+Cj4gUmVnYXJkcwo+IEhpbWFuc2h1Cj4K
ClYxMiB1c2VzIGE1YWUxYmY2NWNlZSwgdGhlIHNhbWUgYmFzZSBhcyBBbnVwJ3MgdjExIGFuZCBz
dGlsbCB0aGUgY3VycmVudApyaXNjdi9mb3ItbmV4dCB0aXAsIGFzIFBhdWwgcmVxdWVzdGVkLgoK
cmM3IGhhcyBhbiBhZGRpdGlvbmFsIHNjcy5oIGNoYW5nZSB0aGF0IGNhdXNlcyB0aGlzIGNvbmZs
aWN0LiBDb3VsZCB5b3UKcGxlYXNlIGFwcGx5IHRoZSBzZXJpZXMgb24gYTVhZTFiZjY1Y2VlIGlu
c3RlYWQ/Cgo+PiBbLi4uXQpUaGFua3MsClpoYW5wZW5nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
