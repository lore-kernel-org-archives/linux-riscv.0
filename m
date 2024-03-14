Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD59C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATkmUMMu2OEkl/PYJ30D8IkNYFqCehJZOkjkCXQK3js=; b=esK0PB/47JpvEZ
	TBEN2dvbZaqbuEq7KYKCn7ANqurP8xQeYdWGL6VFYrMRYHF3cVpPvF5DGBgWd1sT429eHzMfFj06m
	vN/XJkrb2ToTQx2a1v+UiwFR9N5pUgcJT4l5yPdZ3lZB7E8+uodnSiEo3LCIIKBFArVfpxIfNI1ep
	NNyO30JOCE7dU2vmxW4+fio7fyvtyCY1DQfVDMS7Mykp9r+6zx7IC5+Cauy7R2x5vV4ePiuyO+TNX
	orSOFSZcJssW5CFChCoxngH8Yxqdf/j8HSmesVljST3n7QZWMQ5RxZfwbkYE3zYLuhqbB4y3nqMMY
	R8dQSRzi29r1aqoKgV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklNH-0000000ETOD-2rDr;
	Thu, 14 Mar 2024 13:43:59 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklN7-0000000ETKy-49jd;
	Thu, 14 Mar 2024 13:43:51 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6e4efdf31c9so344658a34.1;
        Thu, 14 Mar 2024 06:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710423827; x=1711028627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDiARA/24cHYG8FRrouoTvUxwp5WbH/hNpGJ/9ezCCU=;
        b=tAhmLTUZfCIvNsFgVEhaj2SRZMbg05TmA8LkZi0nOHtXM+NIuW/1/zJc+mXUS9lJKv
         TSvU2t9PC0g9e3FDpEt+t/0CNFJWA5HFKYKPPH7OPmrQBc/DQqItQJfDtnWZAk7VmaGl
         AxZdyniTqIj7IZf/XfvC89Enko1vjKB6GSt9FDM1l4BIVmQ7R8lQpMHKgvoWHXNHuFkN
         tHxhs7fk5SjREM8GW3AP6pMs6niKdP+9ZNVx3eKxgDfofvY/EmWAnbIoxtYD0ayQ1F7G
         AXKsSMAvyxKVwI/PKLJ7Aimn7xN9VkfDB84X0P4UJEBFe0Tnn1FXgFpep7zBaGIHAS1C
         FqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdyRE7Ne0diXp4uGSkO2cQ4+pxz2Ps1xgGi7az7So02iea8uUwqKxPQalQwQsA8+VFfooQ5hy4usuXWI47EtbliUmT7mdyWBlwaSGx+RL3Tv/hV1f1yE/gMYTypvtAFq76bOjouF+qO/bgAlYpkR17EFsNMcM=
X-Gm-Message-State: AOJu0YxVfVNZp32CpIg8/sMwc8wOsnVs9G1nBjRGtjHmehWOR5cAqeCc
	g1ct2nuQrjuHoqN+Wkh5wuxbWTo2Ss1ammw6Z5WXmrcqKs1oV4BIVQGOrOZpF6Y=
X-Google-Smtp-Source: AGHT+IHhk2BvgCyglRGTjvRYxMc6tH1POoKN06lbBAVpSyDPQjS0C1Qu/E7EtwJbK+1MOFEGywGdPg==
X-Received: by 2002:a9d:674e:0:b0:6e6:66b7:4ba6 with SMTP id w14-20020a9d674e000000b006e666b74ba6mr731165otm.9.1710423827205;
        Thu, 14 Mar 2024 06:43:47 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id h2-20020a9d6a42000000b006e66817fdcfsm297612otn.3.2024.03.14.06.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 06:43:47 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-21fe1bc5fc4so335497fac.1;
        Thu, 14 Mar 2024 06:43:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdaL6dF44kL57kGG66U0NqbAbApkwDfqXesnetvRGLdde23oTjdwOF+Rb99eW8P/3hekN6N7sEx8cg5TLXM1pX/bh3Pfpoa83VCpMeaqzrURrSwMgkJnQCPk5a9kv/fS+RNfIEFVWljNx1yHfaLyZaKEqw8+8=
X-Received: by 2002:a0d:fe04:0:b0:60a:4930:5bb1 with SMTP id
 o4-20020a0dfe04000000b0060a49305bb1mr1000757ywf.5.1710423424398; Thu, 14 Mar
 2024 06:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 14:36:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
Message-ID: <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, netdev@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_064350_050517_25D9B270 
X-CRM114-Status: GOOD (  32.91  )
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

SGkgR8O8bnRlciwKCk9uIFR1ZSwgTWFyIDEyLCAyMDI0IGF0IDY6MDPigK9QTSBHdWVudGVyIFJv
ZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+IFNvbWUgdW5pdCB0ZXN0cyBpbnRlbnRp
b25hbGx5IHRyaWdnZXIgd2FybmluZyBiYWNrdHJhY2VzIGJ5IHBhc3NpbmcgYmFkCj4gcGFyYW1l
dGVycyB0byBrZXJuZWwgQVBJIGZ1bmN0aW9ucy4gU3VjaCB1bml0IHRlc3RzIHR5cGljYWxseSBj
aGVjayB0aGUKPiByZXR1cm4gdmFsdWUgZnJvbSBzdWNoIGNhbGxzLCBub3QgdGhlIGV4aXN0ZW5j
ZSBvZiB0aGUgd2FybmluZyBiYWNrdHJhY2UuCj4KPiBTdWNoIGludGVudGlvbmFsbHkgZ2VuZXJh
dGVkIHdhcm5pbmcgYmFja3RyYWNlcyBhcmUgbmVpdGhlciBkZXNpcmFibGUKPiBub3IgdXNlZnVs
IGZvciBhIG51bWJlciBvZiByZWFzb25zLgo+IC0gVGhleSBjYW4gcmVzdWx0IGluIG92ZXJsb29r
ZWQgcmVhbCBwcm9ibGVtcy4KPiAtIEEgd2FybmluZyB0aGF0IHN1ZGRlbmx5IHN0YXJ0cyB0byBz
aG93IHVwIGluIHVuaXQgdGVzdHMgbmVlZHMgdG8gYmUKPiAgIGludmVzdGlnYXRlZCBhbmQgaGFz
IHRvIGJlIG1hcmtlZCB0byBiZSBpZ25vcmVkLCBmb3IgZXhhbXBsZSBieQo+ICAgYWRqdXN0aW5n
IGZpbHRlciBzY3JpcHRzLiBTdWNoIGZpbHRlcnMgYXJlIGFkLWhvYyBiZWNhdXNlIHRoZXJlIGlz
Cj4gICBubyByZWFsIHN0YW5kYXJkIGZvcm1hdCBmb3Igd2FybmluZ3MuIE9uIHRvcCBvZiB0aGF0
LCBzdWNoIGZpbHRlcgo+ICAgc2NyaXB0cyB3b3VsZCByZXF1aXJlIGNvbnN0YW50IG1haW50ZW5h
bmNlLgo+Cj4gT25lIG9wdGlvbiB0byBhZGRyZXNzIHByb2JsZW0gd291bGQgYmUgdG8gYWRkIG1l
c3NhZ2VzIHN1Y2ggYXMgImV4cGVjdGVkCj4gd2FybmluZyBiYWNrdHJhY2VzIHN0YXJ0IC8gZW5k
IGhlcmUiIHRvIHRoZSBrZXJuZWwgbG9nLiAgSG93ZXZlciwgdGhhdAo+IHdvdWxkIGFnYWluIHJl
cXVpcmUgZmlsdGVyIHNjcmlwdHMsIGl0IG1pZ2h0IHJlc3VsdCBpbiBtaXNzaW5nIHJlYWwKPiBw
cm9ibGVtYXRpYyB3YXJuaW5nIGJhY2t0cmFjZXMgdHJpZ2dlcmVkIHdoaWxlIHRoZSB0ZXN0IGlz
IHJ1bm5pbmcsIGFuZAo+IHRoZSBpcnJlbGV2YW50IGJhY2t0cmFjZShzKSB3b3VsZCBzdGlsbCBj
bG9nIHRoZSBrZXJuZWwgbG9nLgo+Cj4gU29sdmUgdGhlIHByb2JsZW0gYnkgcHJvdmlkaW5nIGEg
bWVhbnMgdG8gaWRlbnRpZnkgYW5kIHN1cHByZXNzIHNwZWNpZmljCj4gd2FybmluZyBiYWNrdHJh
Y2VzIHdoaWxlIGV4ZWN1dGluZyB0ZXN0IGNvZGUuIFN1cHBvcnQgc3VwcHJlc3NpbmcgbXVsdGlw
bGUKPiBiYWNrdHJhY2VzIHdoaWxlIGF0IHRoZSBzYW1lIHRpbWUgbGltaXRpbmcgY2hhbmdlcyB0
byBnZW5lcmljIGNvZGUgdG8gdGhlCj4gYWJzb2x1dGUgbWluaW11bS4gQXJjaGl0ZWN0dXJlIHNw
ZWNpZmljIGNoYW5nZXMgYXJlIGtlcHQgYXQgbWluaW11bSBieQo+IHJldGFpbmluZyBmdW5jdGlv
biBuYW1lcyBvbmx5IGlmIGJvdGggQ09ORklHX0RFQlVHX0JVR1ZFUkJPU0UgYW5kCj4gQ09ORklH
X0tVTklUIGFyZSBlbmFibGVkLgo+Cj4gVGhlIGZpcnN0IHBhdGNoIG9mIHRoZSBzZXJpZXMgaW50
cm9kdWNlcyB0aGUgbmVjZXNzYXJ5IGluZnJhc3RydWN0dXJlLgo+IFRoZSBzZWNvbmQgcGF0Y2gg
aW50cm9kdWNlcyBzdXBwb3J0IGZvciBjb3VudGluZyBzdXBwcmVzc2VkIGJhY2t0cmFjZXMuCj4g
VGhpcyBjYXBhYmlsaXR5IGlzIHVzZWQgaW4gcGF0Y2ggdGhyZWUgdG8gaW1wbGVtZW50IHVuaXQg
dGVzdHMuCj4gUGF0Y2ggZm91ciBkb2N1bWVudHMgdGhlIG5ldyBBUEkuCj4gVGhlIG5leHQgdHdv
IHBhdGNoZXMgYWRkIHN1cHBvcnQgZm9yIHN1cHByZXNzaW5nIGJhY2t0cmFjZXMgaW4gZHJtX3Jl
Y3QKPiBhbmQgZGV2X2FkZHJfbGlzdHMgdW5pdCB0ZXN0cy4gVGhlc2UgcGF0Y2hlcyBhcmUgaW50
ZW5kZWQgdG8gc2VydmUgYXMKPiBleGFtcGxlcyBmb3IgdGhlIHVzZSBvZiB0aGUgZnVuY3Rpb25h
bGl0eSBpbnRyb2R1Y2VkIHdpdGggdGhpcyBzZXJpZXMuCj4gVGhlIHJlbWFpbmluZyBwYXRjaGVz
IGltcGxlbWVudCB0aGUgbmVjZXNzYXJ5IGNoYW5nZXMgZm9yIGFsbAo+IGFyY2hpdGVjdHVyZXMg
d2l0aCBHRU5FUklDX0JVRyBzdXBwb3J0LgoKVGhhbmtzIGZvciB5b3VyIHNlcmllcyEKCkkgZ2F2
ZSBpdCBhIHRyeSBvbiBtNjhrLCBqdXN0IHJ1bm5pbmcgYmFja3RyYWNlLXN1cHByZXNzaW9uLXRl
c3QsCmFuZCB0aGF0IHNlZW1zIHRvIHdvcmsgZmluZS4KCj4gRGVzaWduIG5vdGU6Cj4gICBGdW5j
dGlvbiBwb2ludGVycyBhcmUgb25seSBhZGRlZCB0byB0aGUgX19idWdfdGFibGUgc2VjdGlvbiBp
ZiBib3RoCj4gICBDT05GSUdfS1VOSVQgYW5kIENPTkZJR19ERUJVR19CVUdWRVJCT1NFIGFyZSBl
bmFibGVkIHRvIGF2b2lkIGltYWdlCj4gICBzaXplIGluY3JlYXNlcyBpZiBDT05GSUdfS1VOSVQ9
bi4gVGhlcmUgd291bGQgYmUgc29tZSBiZW5lZml0cyB0bwo+ICAgYWRkaW5nIHRob3NlIHBvaW50
ZXJzIGFsbCB0aGUgdGltZSAocmVkdWNlZCBjb21wbGV4aXR5LCBhYmlsaXR5IHRvCj4gICBkaXNw
bGF5IGZ1bmN0aW9uIG5hbWVzIGluIEJVRy9XQVJOSU5HIG1lc3NhZ2VzKS4gVGhhdCBjaGFuZ2Us
IGlmCj4gICBkZXNpcmVkLCBjYW4gYmUgbWFkZSBsYXRlci4KClVuZm9ydHVuYXRlbHkgdGhpcyBh
bHNvIGluY3JlYXNlcyBrZXJuZWwgc2l6ZSBpbiB0aGUgQ09ORklHX0tVTklUPW0KY2FzZSAoY2Eu
IDgwIEtpQiBmb3IgYXRhcmlfZGVmY29uZmlnKSwgbWFraW5nIGl0IGxlc3MgYXR0cmFjdGl2ZSB0
byBoYXZlCmt1bml0IGFuZCBhbGwgdGVzdHMgZW5hYmxlZCBhcyBtb2R1bGVzIGluIG15IHN0YW5k
YXJkIGtlcm5lbC4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
