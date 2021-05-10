Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A023C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 13:16:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB94611F0
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 13:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB94611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G6IefymXcDiYzETOWJXR16WM1I/RX97GkyEgNhk1vBU=; b=X9MCyX+XNiVnBp7cEkuRi59DT
	B1L8LuCxmE8VQ3CU/7VzT4YIukrsgSVYZLWvOd8XQfUWbl7Nm5kQYkGTxsi5HyYb3ktoNhYvoUZ36
	VFHyWPJ80wA18NZiPv3RQbQm+S2YwqRnhaYw8Rih0tLQRafl6SWssF2wfJ8u5ApyXgg52DOnx34vW
	IoovZaen3ceMxtjcDhVg1ULcClO0+cQL3oTSZm63RdJxuEWaoHgyrPqy5Bp2O8X89OKtEzcdimO34
	b4oFSjLnTjtcM/ObZFK6K3creV+J3HLaSRKHKBWVUrXOIu6USyfwlooiIHA2VwIQ0gHqzHjmkXWDm
	ZOAePxWKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg5lr-00EQHv-AJ; Mon, 10 May 2021 13:16:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg5ln-00EQHF-Ug; Mon, 10 May 2021 13:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Sh4i9feljTPFrIfpR/IU/E8n0D3Fda88xyQfypmum7w=; b=qjmhHIfnAN25hkqxgvatn6jWm6
 t6ZTfc7co6EQqiGNfqf8DPSOHno6ZQvBPinQH1Ksx9YsYMMBwEyrPibB/QmiTDiBZBg+IQpwnV7y+
 QeokzjadO0cRR3sqmU61NGIBa0NlCnhwi18CrgWARJMY3XhUWTnAQWmJNK0o61rGmwF5OAF/jDvA8
 jKo3BmZBQxt9d6Ps8jhn1RWFWcxy6/UBxvH9PZmaC3Wmmt0Xjj3V9HEOMb+PT49pbhuouRGYGMQgl
 Xpf9wNu5H3zkf6u45SAi6iFG2Bf8jc/TobUtXrFxaZ+Z7DPh9q1/i3wJ68cpvBv8bT+E/ogKqqE93
 +iPPgi5Q==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg5ll-008jse-52; Mon, 10 May 2021 13:16:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso11138553wmj.2; 
 Mon, 10 May 2021 06:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sh4i9feljTPFrIfpR/IU/E8n0D3Fda88xyQfypmum7w=;
 b=GfQpYA/u/ESXNzCwhJN35I1L0Sb2vRVeukRNG83W8xG2OMlDA6+i5W0OODo/+LWE9E
 ivWW5//Dci3M+PXPgJnH/odM7KtTO7yjQKrEe7KAvh4E7fvrd/ZuLkJAZP62sWtsDMuB
 AIqgCRqoTLZzj0iGC6/REa3QuGlmZjiRxifV0mZYrMLJSap8JjiujnvbMmFTzTlx+O95
 x9XnwiLNDr5qqWcsdoyW+ETG1hWAlzA+FW12aKJEwh2j5DlnppfpjkE6ahf9DAyZ8V+v
 c4HLN0tsaWZM2+zfMzrOFU3u/mXI98pyg6LlDYSgFBtDuHlk1DmX0lhge4HX1KOLhtwA
 z+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sh4i9feljTPFrIfpR/IU/E8n0D3Fda88xyQfypmum7w=;
 b=bFH+rlu4cbiBQuXkNB8BIJmDV1ALoepYkWIsEbBSvDQlZnGChwXp2j4BGxO9oZnbsL
 q9DSA1p88WExuKdYJUA8RIRttreXeo3+EThQoS3wRXdQAgGUObSCqWCxXT0Smj55KPO7
 LIPmyhdmv5RDY7DodStFOdaTX5XC4pi1aVZMY3NP4unWsaDUDFMaURs+9L4ukPXQXFs4
 lkrBohA9UepunyTUzXIsOM4uThbA1+ZViCRgIUex13fsvq5318/7garP0K8az/GnMHWq
 zscdz05edBJohYLDvFRURF+gcb6rokFjaiQiUxhK6St2X8cLYt6j8nhNbWWh8lY/Wl+W
 zSZA==
X-Gm-Message-State: AOAM5314dPofxSBF/pmFtKNsxjIZmSo5owwHR27oU8qugqHA8vVxXefU
 Z2jF7znlqyhCAtu0go9gHkY=
X-Google-Smtp-Source: ABdhPJysoQ4YBpE1J87NsTC/Z24p8NQqGLKPSudpVCmtLwZFhM2Wy0R7/k0aKiXMKdpTI23nPdYVEw==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr36980376wmo.95.1620652578722; 
 Mon, 10 May 2021 06:16:18 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id s1sm27945073wmj.8.2021.05.10.06.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 06:16:17 -0700 (PDT)
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
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
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
Date: Mon, 10 May 2021 14:16:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210510135518.305cc03d@coco.lan>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_061621_215065_44582F62 
X-CRM114-Status: GOOD (  20.26  )
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

T24gMTAvMDUvMjAyMSAxMjo1NSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IFRoZSBt
YWluIHBvaW50IG9uIHRoaXMgc2VyaWVzIGlzIHRvIHJlcGxhY2UganVzdCB0aGUgb2NjdXJyZW5j
ZXMKPiB3aGVyZSBBU0NJSSByZXByZXNlbnRzIHRoZSBzeW1ib2wgZXF1YWxseSB3ZWxsCgo+IAkt
IFUrMjAxNCAoJ+KAlCcpOiBFTSBEQVNICkVtIGRhc2ggaXMgbm90IHRoZSBzYW1lIHRoaW5nIGFz
IGh5cGhlbi1taW51cywgYW5kIHRoZSBsYXR0ZXIgZG9lcyBub3QKIHNlcnZlICdlcXVhbGx5IHdl
bGwnLiAgUGVvcGxlIHVzZSBlbSBkYXNoZXMgYmVjYXVzZSDigJQgZXZlbiBpbgogbW9ub3NwYWNl
IGZvbnRzIOKAlCB0aGV5IG1ha2UgdGV4dCBlYXNpZXIgdG8gcmVhZCBhbmQgY29tcHJlaGVuZCwg
d2hlbgogdXNlZCBjb3JyZWN0bHkuCkkgYWNjZXB0IHRoYXQgc29tZSBvZiB0aGUgb3RoZXIgZGlz
dGluY3Rpb25zIOKAlCBsaWtlIGVuIGRhc2hlcyDigJQgYXJlCiBuZWVkbGVzc2x5IHBlZGFudGlj
ICh0aG91Z2ggSSBkb24ndCBkb3VidCB0aGVyZSBpcyBzb21lb25lIG91dCB0aGVyZQogd2hvIHdp
bGwgZ2xhZGx5IGRlZmVuZCB0aGVtIHdpdGggdGhlIHNhbWUgZmVydm91ciB3aXRoIHdoaWNoIEkg
YXJndWUKIGZvciB0aGUgZW0gZGFzaCkgYW5kIEkgd291bGRuJ3QgdGFrZSB0aGUgdHJvdWJsZSB0
byB1c2UgdGhlbSBteXNlbGY7CiBidXQgSSB0aGluayB0aGVyZSBpcyBhIHJlYXNvbmFibGUgYXNz
dW1wdGlvbiB0aGF0IHdoZW4gc29tZW9uZSBnb2VzCiB0byB0aGUgZWZmb3J0IG9mIHVzaW5nIGEg
VW5pY29kZSBwdW5jdHVhdGlvbiBtYXJrIHRoYXQgaXMgc2VtYW50aWMKIChyYXRoZXIgdGhhbiBt
ZXJlbHkgdHlwb2dyYXBoaWNhbCksIHRoZXkgcHJvYmFibHkgaGFkIGEgcmVhc29uIGZvcgogZG9p
bmcgc28uCgo+IAktIFUrMjAxOCAoJ+KAmCcpOiBMRUZUIFNJTkdMRSBRVU9UQVRJT04gTUFSSwo+
IAktIFUrMjAxOSAoJ+KAmScpOiBSSUdIVCBTSU5HTEUgUVVPVEFUSU9OIE1BUksKPiAJLSBVKzIw
MWMgKCfigJwnKTogTEVGVCBET1VCTEUgUVVPVEFUSU9OIE1BUksKPiAJLSBVKzIwMWQgKCfigJ0n
KTogUklHSFQgRE9VQkxFIFFVT1RBVElPTiBNQVJLCihUaGVzZSBhcmUgcHVyZWx5IHR5cG9ncmFw
aGljLCBJIGhhdmUgbm8gcHJvYmxlbSB3aXRoIGR1bXBpbmcgdGhlbS4pCgo+IAktIFUrMDBkNyAo
J8OXJyk6IE1VTFRJUExJQ0FUSU9OIFNJR04KUHJlc3VtYWJseSB0aGlzIGlzIGFwcGVhcmluZyBp
biBtYXRoZW1hdGljYWwgZm9ybXVsYWUsIGluIHdoaWNoIGNhc2UKIGNoYW5naW5nIGl0IHRvICd4
JyBsb3NlcyBzZW1hbnRpYyBpbmZvcm1hdGlvbi4KCj4gVXNpbmcgdGhlIGFib3ZlIHN5bWJvbHMg
d2lsbCBqdXN0IHRyaWNrIHRvb2xzIGxpa2UgZ3JlcCBmb3Igbm8gZ29vZAo+IHJlYXNvbi4KTkJT
UCwgc3VyZS4gIFRoYXQgb25lJ3MgcHJvYmFibHkgYW4gYXJ0ZWZhY3Qgb2Ygc29tZSBkb2N1bWVu
dCBmb3JtYXQKIGNvbnZlcnNpb24gc29tZXdoZXJlIGFsb25nIHRoZSBsaW5lLCBhbnl3YXkuCkJ1
dCB3aGF0IGtpbmRzIG9mIHRoaW5ncyB3aXRoIMOXIG9yIOKAlCBpbiBhcmUgZ29pbmcgdG8gYmUg
Z3JlcHQgZm9yPwoKSWYgdGhlcmUgYXJlIGVtIGRhc2hlcyBseWluZyBhcm91bmQgdGhhdCBzZW1h
bnRpY2FsbHkgX3Nob3VsZF8gYmUKIGh5cGhlbi1taW51cyAob25lIG9mIHlvdXIgcGF0Y2hlcyBJ
J3ZlIHNlZW4sIGZvciBpbnN0YW5jZSwgZml4ZXMgYW4KICplbiogZGFzaCBtb29ubGlnaHRpbmcg
YXMgdGhlIG9wdGlvbiBjaGFyYWN0ZXIgaW4gYW4gYGV0aHRvb2xgCiBjb21tYW5kIGxpbmUpLCB0
aGVuIHN1cmUsIGNvbnZlcnQgdGhlbS4KQnV0IGFueSB0aW1lIHNvbWVvbmUgaXMgdXNpbmcgYSBV
bmljb2RlIGNoYXJhY3RlciB0byAqZXhwcmVzcwogc2VtYW50aWNzKiwgZXZlbiBpZiB5b3UgaGFw
cGVuIHRvIHRoaW5rIHRoZSBzZW1hbnRpYyBkaXN0aW5jdGlvbgogaW52b2x2ZWQgaXMgYSBwZWRh
bnRpYyBvciB1bmltcG9ydGFudCBvbmUsIEkgdGhpbmsgeW91IG5lZWQgYW4KIGV4cGxpY2l0IGdy
ZXAgY2FzZSB0byBqdXN0aWZ5IEFTQ0lJZnlpbmcgaXQuCgotZWQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
