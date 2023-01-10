Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E56C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 21:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zD5qprLtZzbPG+mLIUYBPTtMPjOmrdxeQ9+7zvXqwA4=; b=aSzJOwsqwxMwh4
	aSJ3z5Cc1PbVcICvcOYCEW1U0Sg+5xSzVl7dH9yDfn11hUlV0b4wOoYP3zE5vhTs4+knh/KKjxX/Y
	j/dXJYo88VzDbY4BPkszQ7PXy2h5AsnYPi7gWxy5+hzHXvhq21VMjNn6sHmzqkCExmnvKYLCIwEH5
	JvfXITkbBWjSUNVDnY97jQcqc2n5IR7ELzWQ1/MAwwS+HHUTqCf3WaGMzZq9FrR5lBL8S+y0qkjur
	Vf2up9cpE2WU5JN+SR/etq+Au32rCzZbp6VPINmOLZBu0fs21QNgUZG7E89u2/odQ9RGw+/h2TKtK
	Va9cF/3t4woUGjg4QDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMWM-008g3A-Dk; Tue, 10 Jan 2023 21:51:02 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMWJ-008g25-7U
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 21:51:01 +0000
Received: by mail-pf1-x42f.google.com with SMTP id a184so9925174pfa.9
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 13:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XmwA1TA46fJDMKzQ6yPSf40jLo6xYZV+jW12Z9cySpE=;
        b=EwWeJ1IU2g7unQu4NqNrdpHomO6xXJngzZZAHtKy0kXY5GNGwKUKgfXTz5T3RgPlfO
         QqeNILS/WAr4JJYpEfy6U4OwBHQJlLmLc98xNvZcUIJIG+505mVP1bKpCDmw6wxQIYBi
         E5jQP8w3FCP5LeEF3AMf5g3ZkpQvkA22lWT/0sZchjxRxN8X5/IQse4JMLWkEVq4jr3z
         eI/EFkCS2f3cssbAFrqTMrQM25UkPTJiLmgDNwnlSviQjv9ESthitfqeARC4X8aHTwg+
         TrB/K3oW7koS0N3j+/VbNpO6X09Ny7UjPrLixDekOzFHHTGyN41zTqVr/JHjjNQZ8jwv
         PfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmwA1TA46fJDMKzQ6yPSf40jLo6xYZV+jW12Z9cySpE=;
        b=f91MSNd7EVQzjs8NlOiwQv+QDwKAp4hSfnzS9+OaT5OSTYRsq9vsQ3d2dp7Uu0W0WF
         jHsgkXcuxvQFSJZeRggHUMGF3KZeSZNmaYMYYtg0ZFetsI6i2Amr/foX0wFXh5Xnudt3
         uIPuylelpTpLHI2lWHQZSsgzp1TOJkB/e8P1y7zi7PnwZfb0Ab3B58JmvMfIyAmmd7sw
         TuHZQjeXT6KL9ITaZIO9GG0LUDPa6NAN7qJt6RFnRxJp6dVEqjRX4EQ1hkngLh3Tuamd
         8rFhp8Pzd/U6VHBQwzM0mKEqgROBKFsrDVLr/muR7kU2a3MvFl8DN6ZdvjCoDRVi6e9f
         Oh5A==
X-Gm-Message-State: AFqh2krC1R8C2vLfO6Y53qthPkSOcRDw9tdz6xSyr3A08FcLgrCxAHEh
	fWHMTPeIB5lKven6LKLn0m3M+Q==
X-Google-Smtp-Source: AMrXdXuOLCiWRvxtD0NnhH1Khr0ICRsvt1VF+10sGucav75R/w2OdzmuAhXrc24bJe07VGDIB0bNqg==
X-Received: by 2002:a05:6a00:2ad:b0:589:5504:1508 with SMTP id q13-20020a056a0002ad00b0058955041508mr6575849pfs.19.1673387457785;
        Tue, 10 Jan 2023 13:50:57 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id i6-20020aa796e6000000b005884d68d54fsm4916126pfq.1.2023.01.10.13.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 13:50:57 -0800 (PST)
Message-ID: <6dcdd143-ff1c-41f7-9f46-0c4505575669@rivosinc.com>
Date: Tue, 10 Jan 2023 13:50:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: elf: add .riscv.attributes parsing
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 palmer@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Guo Ren <guoren@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux@rivosinc.com,
 kernel test robot <lkp@intel.com>
References: <20230110201841.2069353-1-vineetg@rivosinc.com>
 <01AF458D-1EDC-47D1-A902-A686E2DF26AF@jrtc27.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <01AF458D-1EDC-47D1-A902-A686E2DF26AF@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_135059_515304_4E66B985 
X-CRM114-Status: GOOD (  16.42  )
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

CgpPbiAxLzEwLzIzIDEyOjQ4LCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiBPbiAxMCBKYW4gMjAy
MywgYXQgMjA6MTgsIFZpbmVldCBHdXB0YSA8dmluZWV0Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+
PiBUaGlzIGltcGxlbWVudHMgdGhlIGVsZiBsb2FkZXIgaG9vayB0byBwYXJzZSBSViBzcGVjaWZp
Ywo+PiAucmlzY3YuYXR0cmlidXRlcyBzZWN0aW9uLiBUaGlzIHNlY3Rpb24gaXMgaW5zZXJ0ZWQg
YnkgY29tcGlsZXJzCj4+IChnY2MvbGx2bSkgd2l0aCBidWlsZCByZWxhdGVkIGluZm9ybWF0aW9u
IHN1Y2ggYXMgLW1hcmNoIG9yZ2FuaXplZCBhcwo+PiB0YWcvdmFsdWUgYXR0cmlidXRlIHBhaXJz
Lgo+Pgo+PiBJdCBpZGVudGlmaWVzIHRoZSB2YXJpb3VzIGF0dHJpYnV0ZSB0YWdzIChhbmQgY29y
cmVzcG9uZGluZyB2YWx1ZXMpIGFzCj4+IGN1cnJlbnRseSBzcGVjaWZpZWQgaW4gdGhlIHBzQUJJ
IHNwZWNpZmljYXRpb24uCj4+Cj4+IFRoaXMgcGF0Y2ggb25seSBpbXBsZW1lbnRzIHRoZSBlbGYg
cGFyc2luZyBtZWNoYW5pY3MsIGxlYXZpbmcgb3V0IHRoZQo+PiByZWNvcmRpbmcvdXNhZ2Ugb2Yg
dGhlIGF0dHJpYnV0ZXMgdG8gc3Vic2VxdWVudCBwYXRjaGVzLgo+Pgo+PiBSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ICAjIGNvZGUgdW5kZXIgQ09ORklHX0NP
TVBBVAo+PiBTaWduZWQtb2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMuY29t
Pgo+IFRoaXMgY29kZSBpcyBmdWxsIG9mIGJ1ZmZlciBvdmVycnVucyBhbmQgdW5pbml0aWFsaXNl
ZCByZWFkcyBpbiB0aGUKPiBwcmVzZW5jZSBvZiBtYWxpY2lvdXMgZmlsZXMsCgpXaGlsZSB0aGUg
b3V0ZXIgbG9vcCBpcyBib3VuZCwgaW5kZWVkIHRoZSBpbnRlcm5hbCBwb2ludGVyIGluY3JlbWVu
dHMgCmNvdWxkIGdldCBvb2IuCkkgZG9uJ3QgcmVjYWxsIHNlZWluZyBleGlzdGluZyBleHBsaWNp
dCAic2FmZSIgcG9pbnRlciwgc28gdGhpbmtpbmcgb2YgCmNvb2tpbmcgc29tZXRoaW5nIHVwLgpU
aGUgY29uY2VwdHVhbCBpZGVhIGlzIHRvIHJlcGxhY2UKCiDCoMKgwqAgcCArPSA0Cgp3aXRoCgog
wqDCoCBQVFJfSU5DKHAsIDQsIHBfbWF4KQoKQW5kIHNpbWlsYXJseSByZXBsYWNlCgogwqDCoMKg
IHdoaWxlICgqcCsrICE9ICdcMCcpCgp3aXRoCgogwqDCoMKgIHdoaWxlICgqcCAhPSAnXDAnKQog
wqDCoMKgwqDCoMKgwqDCoMKgIFBUUl9JTkMocCwgMSwgcF9tYXgpCgpJcyB0aGF0IHN1ZmZpY2ll
bnQgb3IgeW91IGhhZCBzb21ldGhpbmcgZWxzZSBpbiBtaW5kLgoKCj4gYW5kIGZhaWxzIHRvIGNo
ZWNrIHRoZSB2ZXJzaW9uLCB2ZW5kb3IgYW5kIHN1Yi1zdWJzZWN0aW9uIHRhZy4KClRoYXQgaXMg
bm93IGFkZGVkLgoKPiBZb3UgYWxzbyBzaG91bGQgaGFuZGxlIG1vcmUgdGhhbiBvbmUgc3ViLXN1
YnNlY3Rpb24gZXZlbiBpZiB0b29scyBkb27igJl0Cj4gZW1pdCBpdCB0b2RheS4KCkp1c3QgdG8g
YmUgb24gc2FtZSBwYWdlLCBhIHN1Yi1zZWN0aW9uIGltcGxpZXMgdGhlIGZvbGxvd2luZwoKIMKg
wqDCoMKgwqAgdWludDMyOmxlbiwgTlRCUzp2ZW5kb3ItbmFtZSwgdWludDg6IFRhZ19maWxlLCB1
aW50MzI6ZGF0YS1sZW4sIAo8dGFnPjx2YWx1ZT4uLi4uCgpJZiBzbywgdGhlIGNvZGUgZG9lcyBz
dXBwb3J0IG11bHRpcGxlIG9mIHRoZXNlCgo+IFlvdSBhbHNvIGhhdmUgYW4gdW5hbGlnbmVkIGFj
Y2VzcyBmb3IgcmVhZGluZyB0aGUgc3ViLXN1YnNlY3Rpb27igJlzIGRhdGEKPiBsZW5ndGggKG1h
eWJlIHRoYXTigJlzIG9rIGluIGtlcm5lbCBsYW5kLCBidXQgd29ydGggbWFraW5nIHN1cmUpLgoK
VHJ1ZSwgSSd2ZSBhZGRlZCBnZXRfdW5hbGlnbmVkX2xlMzIgZm9yIHRob3NlIG5vdwoKVGh4LAot
VmluZWV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
