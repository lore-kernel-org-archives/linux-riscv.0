Return-Path: <SRS0=Dv9V=MQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AF7C4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 02:14:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D30860EB5
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 02:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D30860EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfinJlOA3lvFhKHbq3e8TvSH1ASle6qKbxpJbi/hV4I=; b=h1IF/Q2o7rbcd7/o3K3ofWnH/C
	j5u+pjJIYImP70lG2f09/U8O7IXGo/NuRMumxrOFIw9JVW4AicNhzBtPbENpEqnFRbuREfRDuOOXP
	aZ7Ug39/jRcFuypVZpklJuErDNWMC2cTUXUGS3IepZKmJf9bAKq/jcd8iFL6Rs/6gbVOD2RnYnX4j
	bbI+lI7UtPicQLFeAvjaDaoslplKH0A+tvfzjCVmstqvqGxaRD44CESJ+OmLIO6w/MWLR7WXbK/oS
	CdqavuvT4g2k1rk82VQBuNGq+nCnnkr0O8kFBpPI7x1EDiGrtjbg3ky2cqReR71wwwb/6RnE0rgL6
	FbwzjKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m77Aq-006ZFt-4I; Sat, 24 Jul 2021 02:13:56 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m77An-006ZFK-Gp
 for linux-riscv@lists.infradead.org; Sat, 24 Jul 2021 02:13:55 +0000
Received: by mail-ot1-x335.google.com with SMTP id
 x15-20020a05683000cfb02904d1f8b9db81so3867698oto.12
 for <linux-riscv@lists.infradead.org>; Fri, 23 Jul 2021 19:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3CjAkz2rbpfDTDykSfg6TYvqG+xZm+08z3kG9+FzpqQ=;
 b=PumW6vTF3OQbz4r0hupGJyZ2Ymio43RPxINIzs94H/MUmq1PRZItJYHpYjIJufqzO0
 ZUE4RnZ1+xxOMLXNrOefcBGA8YwMIT5aYzcGEv1tkoK4kpogcsRBVOpJWPFb3nJV+I/q
 4tZeRXVga5OHfgfsCMTGsEHGpWTUa50aV/7g4HRJeFYbx+LPiRgekbghJNALAACfDfM9
 6rDGAqiDLmItY+oMvQz8YhefuFfplrRB1eHYsSAJ6JFMoGgGKGi/7R0wpXtF9isMlkV7
 hc/G5Jx3ymX3Z1UUU+DF+M8qwgTvue0u8uH09M9AdhwublBCrFzNAj2pq7ZxoWPe3Xrn
 abMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3CjAkz2rbpfDTDykSfg6TYvqG+xZm+08z3kG9+FzpqQ=;
 b=nWz3rKwT74/i3AW+d+scsTXZuDPnb7QXQBHOP5+wLTENd9i2KI4jbsLThbuRNui3i4
 uAkSJDIUdvEWwrxn+HalLkxlYa+6+8EwSAPgwFO7j0lUPqnBvPB6Ledt6Vyd4kKRsJmo
 GKFyva6or+t1T7cy17HRJM7s3r5M8Lx5iD/yKcft8eVclP7PC8eC5AjrMvJBrEvv0L4B
 lw7IAmpUIaB8+9hP5Mjm/0NSwOh8lp2P3yje5vBJiWs/VsDisMXjlDM/z+X/HsvOA5TN
 0jUnwZtWQBi0QFly7BAnhmOzE7eC5fhFZ6THswd5EWKPJmhrAIALa7614aluul9zmnjf
 bWgQ==
X-Gm-Message-State: AOAM532oBY6tVfzRqettvB9NldKcY2Hzr5Ev1YKme5AXv/+ioLjW9jV8
 /fkBMZi+1Vz/WzOERVpa16q3vcr0RU0=
X-Google-Smtp-Source: ABdhPJwELDcuejERxKfOH2VhD4WeSAsv6zdHykutuSV2cLOte104DCXdH0dRCWL8+vW6fnGWy9dsAA==
X-Received: by 2002:a05:6830:16cb:: with SMTP id
 l11mr4912645otr.209.1627092829813; 
 Fri, 23 Jul 2021 19:13:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u126sm1211034ooa.23.2021.07.23.19.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 19:13:49 -0700 (PDT)
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com
References: <mhng-1b892781-2ee8-476b-90b8-44b5cca45cf9@palmerdabbelt-glaptop>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] riscv: Disable STACKPROTECTOR_PER_TASK if
 GCC_PLUGIN_RANDSTRUCT is enabled
Message-ID: <9b3a28fe-9f05-580d-0266-22ff9856096c@roeck-us.net>
Date: Fri, 23 Jul 2021 19:13:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <mhng-1b892781-2ee8-476b-90b8-44b5cca45cf9@palmerdabbelt-glaptop>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_191353_641388_973C81FA 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy8yMy8yMSA1OjU4IFBNLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBUdWUsIDA2IEp1
bCAyMDIxIDA5OjI2OjIxIFBEVCAoLTA3MDApLCBsaW51eEByb2Vjay11cy5uZXQgd3JvdGU6Cj4+
IHJpc2N2IHVzZXMgdGhlIHZhbHVlIG9mIFRTS19TVEFDS19DQU5BUlkgdG8gc2V0Cj4+IHN0YWNr
LXByb3RlY3Rvci1ndWFyZC1vZmZzZXQuIFdpdGggR0NDX1BMVUdJTl9SQU5EU1RSVUNUIGVuYWJs
ZWQsIHRoYXQKPj4gdmFsdWUgaXMgbm9uLWRldGVybWluaXN0aWMsIGFuZCB3aXRoIHJpc2N2OmFs
bG1vZGNvbmZpZyBvZnRlbiByZXN1bHRzCj4+IGluIGJ1aWxkIGVycm9ycyBzdWNoIGFzCj4+Cj4+
IGNjMTogZXJyb3I6ICc4MTIwJyBpcyBub3QgYSB2YWxpZCBvZmZzZXQgaW4gJy1tc3RhY2stcHJv
dGVjdG9yLWd1YXJkLW9mZnNldD0nCj4+Cj4+IEVuYWJsZSBTVEFDS1BST1RFQ1RPUl9QRVJfVEFT
SyBvbmx5IGlmIEdDQ19QTFVHSU5fUkFORFNUUlVDVCBpcyBkaXNhYmxlZAo+PiB0byBmaXggdGhl
IHByb2JsZW0uCj4+Cj4+IEZpeGVzOiBmZWEyZmVkMjAxZWU1ICgicmlzY3Y6IEVuYWJsZSBwZXIt
dGFzayBzdGFjayBjYW5hcmllcyIpCj4+IENjOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5l
dD4KPj4gLS0tCj4+IMKgYXJjaC9yaXNjdi9LY29uZmlnIHwgMSArCj4+IMKgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcg
Yi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5kZXggNDY5YTcwYmQ4ZGE2Li4zYWZiODRmYTIxOTAg
MTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiArKysgYi9hcmNoL3Jpc2N2L0tj
b25maWcKPj4gQEAgLTQ4Niw2ICs0ODYsNyBAQCBjb25maWcgQ0NfSEFWRV9TVEFDS1BST1RFQ1RP
Ul9UTFMKPj4KPj4gwqBjb25maWcgU1RBQ0tQUk9URUNUT1JfUEVSX1RBU0sKPj4gwqDCoMKgwqAg
ZGVmX2Jvb2wgeQo+PiArwqDCoMKgIGRlcGVuZHMgb24gIUdDQ19QTFVHSU5fUkFORFNUUlVDVAo+
PiDCoMKgwqDCoCBkZXBlbmRzIG9uIFNUQUNLUFJPVEVDVE9SICYmIENDX0hBVkVfU1RBQ0tQUk9U
RUNUT1JfVExTCj4+Cj4+IMKgY29uZmlnIFBIWVNfUkFNX0JBU0VfRklYRUQKPiAKPiBUaGFua3Ms
IHRoaXMgaXMgb24gZml4ZXMuwqAgSSBkbyBhbiBhbGxtb2Rjb25maWcgYnVpbGQgYW5kIGhhdmVu
J3Qgc2VlbiB0aGVzZSBmYWlsdXJlcywgaXMgdGhlcmUgc29tZXRoaW5nIHNwZWNpYWwgSSBuZWVk
IHRvIGRvIHRvIGdldCB0aGlzIHdvcmtpbmc/wqAgSSBrbm93IG5vdGhpbmcgYWJvdXQgR0NDIHBs
dWdpbnMuLi4KClRoZSBwcm9ibGVtIGlzIHNlZW4gb25seSByYW5kb21seS4gSXQgZGVwZW5kcyBv
biB0aGUgdmFsdWUKb2YgVFNLX1NUQUNLX0NBTkFSWSBpbiBpbmNsdWRlL2dlbmVyYXRlZC9hc20t
b2Zmc2V0cy5oLgpUaGF0IGluIHR1cm4gZGVwZW5kcyBvbiB0aGUgbG9jYXRpb24gb2Ygc3RhY2tf
Y2FuYXJ5CmluIHN0cnVjdCB0YXNrX3N0cnVjdC4gWW91IG1heSBoYXZlIHRvIHRyeSBzZXZlcmFs
IHRpbWVzCmZyb20gYSBjbGVhbiB0cmVlIHRvIHNlZSB0aGUgcHJvYmxlbS4KCkd1ZW50ZXIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
