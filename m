Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A8DC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 13:59:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA8D61154
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 13:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BA8D61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WAfjRfs0tNA5mZGFnGS4d3f/DEhmLZWMTP7YgZ8P0Ho=; b=bYKZpxHEFDxGMcS+wwfemgUEj
	WAODVJz4L19Dk4E3qVXMmm2HhZwHe6HXicM8PpUYp4A578SbRAB0gZ9MIf8pO8Nnf+8KaIIf0Wl0Z
	tLighgy6XtanumGoSitQhvecLe8/xqysz4In4N4tleGL2A8RcvNl9tjsrd9qYWy/N0oNBYwiubFcZ
	U3aSOsoy2E960uOt9Yw567WJPJdgybVzO1xnXjeumGx2jSLLB5C+y+adAfAYQQLJ7dqTkHYSNRXTa
	FXwRmUZZoF4froWQJFEODDYO2s2XveMn7vVc4J+D2DCWCQCNqwBln8ognPbOEwmOBpqC95pFGIn6K
	4P91ORdBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg6R9-00EYFJ-F9; Mon, 10 May 2021 13:59:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6R6-00EYEs-U2; Mon, 10 May 2021 13:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=oOiV5WgMi7Wi96u1A0j7aVHx72rSJUWKb9L7JASEw6U=; b=f7uKpjnGCKSO99Wgy+mymOD0YM
 m16mm213JiLk8N9n7o212iUiI8FwdK/3FhrP2paLaz0AMB7GXbbOUVYSRim/7IaWD7DJD6tNtEwET
 sjBG08LheG3QX5EXVeC3CqT84AH6zO0+YxVf58pMlc5r9nwQxcG7WQrZADRgviH7aO5cUoX1j+Kex
 zy9nqNwC7f1ClP4ubQizUZHkbtCd1H4w+lYI+HQ+9GBbWE6lIsOj8Qp5ACjlgmR15yW7y2G9fMlua
 iBf9sceHHzS+FxHrXF7tL5jj5xSVJBC/aKnAGntmqmgjw2E8vHdX1Vqtb1tzabpCDM1zBwBIsDTpv
 lrm0NglQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6R4-008mU2-FI; Mon, 10 May 2021 13:59:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so8951488wmb.3; 
 Mon, 10 May 2021 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oOiV5WgMi7Wi96u1A0j7aVHx72rSJUWKb9L7JASEw6U=;
 b=eI3N1Fpg9OGfxDYeN9CkM6JnUmUHl5WgQKsZJBAEe06N6eQIW+N/2eMqTIlrsyK/qM
 Xa35uzmXt4bi7Z5ExQmBDGcCmQr1UD910O1m2RozktwaOIV8OjhOXtuMqdS2t5KIlfV2
 /xSjuQtpNfwsgUMZT4YbuSWeEoVUpnkLWdYWx57GHC/JMnIbfeomB6X1EwhI6GqtNjJz
 5mS+m2iGgDDSAr7pACiBgtShvHO5CxZyag+ZmeEb/XAmakP22Iz1mAVAu5X4yPcneMls
 MNKS6aX+UYGYTiDpkPzh+zNyC5KsbwVbzbmTl9DNNLPJNUbSwFzwjXpWYoyfaT3bHk/5
 tcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oOiV5WgMi7Wi96u1A0j7aVHx72rSJUWKb9L7JASEw6U=;
 b=AJDHKLya3Re8E70vb4tNRuHe4+a9gPmqfT4W2XKoxG97BS30DKgOwJ7QwhuePkflOJ
 Xvue+5LC/NTmmXZa2PsRpB/49JLosIrbmnOjHn+AVihPiQ4nj1NcBSglv3/wgJL8plxO
 7F3jXHcgl96ms+dAKWR6wBO01BbfJMMBelhVZVAJm6rthKegxlVUPdvAY2dqzuNFMJTb
 BFpymN6j2YSdX9xE+K/qmD3petPphsCZGxfDNDJqdCUhBdXg+zU6CsTygFlYT5l7ZvGx
 fwxLv5FTfKF782oBfVlC5CzAKB0ixSovNbPIKQkWf4kFlZar9bmXd1SLXB1wg7KW8CT+
 FnSg==
X-Gm-Message-State: AOAM533NbngdpkbG41WMf3pLcHIfDOSzC9PBzoa3q+D7yY23k/AWgqBe
 8BqBmdqwyQGx00uVgQTUZVA=
X-Google-Smtp-Source: ABdhPJxuRWxshXLY3D3BIGKPZC8k+BUcpGElfoLV7AagS8fiv45gCBBhTdzQWkysFh21R1ZatES2dQ==
X-Received: by 2002:a1c:e38a:: with SMTP id
 a132mr26226331wmh.135.1620655141215; 
 Mon, 10 May 2021 06:59:01 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id d127sm25703586wmd.14.2021.05.10.06.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 06:59:00 -0700 (PDT)
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
 kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sgx@vger.kernel.org, linux-usb@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, netdev@vger.kernel.org,
 rcu@vger.kernel.org, x86@kernel.org
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
 <20210510153807.4405695e@coco.lan>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <b3366f65-35e1-8f1a-d8d8-ebd444c9499d@gmail.com>
Date: Mon, 10 May 2021 14:58:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210510153807.4405695e@coco.lan>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_065902_531202_AB40D2A8 
X-CRM114-Status: GOOD (  14.36  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMDUvMjAyMSAxNDozOCwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IEVtIE1v
biwgMTAgTWF5IDIwMjEgMTQ6MTY6MTYgKzAxMDAKPiBFZHdhcmQgQ3JlZSA8ZWNyZWUueGlsaW54
QGdtYWlsLmNvbT4gZXNjcmV2ZXU6Cj4+IEJ1dCB3aGF0IGtpbmRzIG9mIHRoaW5ncyB3aXRoIMOX
IG9yIOKAlCBpbiBhcmUgZ29pbmcgdG8gYmUgZ3JlcHQgZm9yPwo+IAo+IEFjdHVhbGx5LCBvbiBh
bG1vc3QgYWxsIHBsYWNlcywgdGhvc2UgYXJlbid0IHVzZWQgaW5zaWRlIG1hdGggZm9ybXVsYWUs
IGJ1dAo+IGluc3RlYWQsIHRoZXkgZGVzY3JpYmUgdmlkZW8gc29tZSByZXNvbHV0aW9uczoKRWho
LCB0aG9zZSBhcmUgYWxzbyBwcm9wZXIgdXNlcyBvZiDDly4gIEl0J3Mgc3RpbGwgYSBtdWx0aXBs
aWNhdGlvbiwKIGFmdGVyIGFsbC4KCj4gaXQgaXMgYSB3YXkgbW9yZSBsaWtlbHkgdGhhdCwgaWYg
c29tZW9uZSB3YW50cyB0byBncmVwLCB0aGV5IHdvdWxkIGJlIAo+IGRvaW5nIHNvbWV0aGluZyBs
aWtlIHRoaXMsIGluIG9yZGVyIHRvIGdldCB2aWRlbyByZXNvbHV0aW9uczoKV2h5IHdvdWxkIHNv
bWVvbmUgYmUgZ3JlcHBpbmcgZm9yICJhbGwgdmlkZW8gcmVzb2x1dGlvbnMgbWVudGlvbmVkIGlu
CiB0aGUgZG9jdW1lbnRhdGlvbiI/ICBUaGF0IHNlZW1zIGNvbnRyaXZlZCB0byBtZS4KCi1lZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
