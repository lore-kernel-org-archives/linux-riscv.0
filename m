Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C7ACA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYTPrj9dPeuSu6nA5XXcz1/1/suSgEmOvJl/n1125pE=; b=B8UvBcDGjiI5zI
	Rwf2xNwEnayGq3fouvrt++dKM/FN9tdk8ZGgSHxW2uFYOS4UVaVRwTXM/7SLto+c8qAWmScZ05efR
	mO/GkO0Odz/W/SWI7qt3wo5g0kDImKsxBDiK07jSvpqpgsmflqdOGCvo3o2vj2Jo0npHVeCbVwRC2
	YjjetYZfts1cU/ZrOxvbVQLoFl37RsGPp0Bee8RXj5TsVIIux3/HsD0Ohap9r7WQ7yeboNCUO6vwF
	PdYXFYltHZ3MTGqTLaYvmj37w6qd7JLpO4Fk9jo5hukAX3I4yCnbdkCVFG3YjT9HgUrR5cDu7Kqlm
	suIq91jVzeA/dNYd1qPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo08f-00000007d7r-1q0d;
	Mon, 18 Aug 2025 13:43:05 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unyxa-00000007KWQ-1neQ
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 12:27:36 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e94cfaa274fso742452276.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755520053; x=1756124853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgCsV8AiRnmTJZZ3lbAOsw5kSBDJj5OV7xzAVtn6XEE=;
        b=V4sggCDKrebjj4I9kHuQrjctSEsZq1iYvasyIQ7H366GQ4lOG9Vqf/5aCYr3xuDd+n
         oG4LlWQc6ujMl8sFeAo+O75+MYbenjuVWavnZn3UswTB4SJq37eNMTnX7t6OzFzb1VPz
         9oH5Gv6fW9aQ1sCAZYRJSsXsQCu4lyWo6kwLPMW5oyh4rdV6zw4mqblONPLL+TF3392k
         8zBoZNsRcY/JdaFo6DRBtximI0A7+0Miqh/ua7HuY6/a0PX9AZYlsobZb81FbkFHomVQ
         spxgXysaYr4m16FrObQNGfZQmOVS784+wijhMNS9tfUqGsdD73sb5jcMvnUMyCqaOpd6
         t8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755520053; x=1756124853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgCsV8AiRnmTJZZ3lbAOsw5kSBDJj5OV7xzAVtn6XEE=;
        b=MFaUWW/LT9d3K80ETIkMrMhCzrK38mbuldGjV6OdV4Og54Iovpn6P0ip2ZoDp3Z59m
         HKrclORKlea/dpNCFsQEtl2Zaj6b7OwVgTXRNxqkIoW+9ZcUe1O1zSVuOsSifXE0Yq1T
         QreJzI2roY74nDa++3icppyNKAVaBfElrkuQuF42sIdUB8P31nrZ+3xgdPJvG/0vnWdQ
         vfzcg3NyDd13X62JotLsLabbHVMSIpk/lpZjCJedlmxxwGc5Vqi8cVAXJKLpySStiUH5
         9cxsQjjfr3x6s/TGhN2+DEk2ufGbHW0nBBYdSmQQkA26HHdWq95v2hCIGHoZDJdt9Gan
         zJcA==
X-Forwarded-Encrypted: i=1; AJvYcCVnhQLLEva2Gfa4oTh8HMwvPOitnlbBAEIYXDQ5/f2aCl+z/h0VJoAYrwtRC8//MsfazVx4I6OsDCswVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyehUsIE4M6/p0fMhWxZZdzvcv7EksoxpsTmk2GUfglOmCBMroz
	hfvYXyuf+jRrX9bvdX7QpZj0ful9YiMpBVIgOwWWU4suk7lkQhb1EkgucRG0Nzd0ckKw//K17Od
	BshWqmXfP1zV7hFzXBABcUHHhTAtWNG59Ac9eSPUnfg==
X-Gm-Gg: ASbGncvXHqaMnok8ts/suliV3+XJItvZZ/Le56kR5MfioU0G9BO8ANK9ZSIEI8NcUtT
	W+2Xy7QLnaoNhY+hYP5eeCBswmAE2ymCUzK0JTq/gR2o7FxoQOnWa36h8XGpK0HqB1U24gRzttg
	452ZTfBpsBEkVfa5TcrEFqJrCZqlS2M3lO3lL6kADYgMO55BikYyZR4nAIKp3tOomCn4OrIeaGb
	8Run09BKb9F24om
X-Google-Smtp-Source: AGHT+IGCtbq8dlv5BhifYFkVWdTwGtpLB8eowifqW63WzaF5/IhaKxhO1X64809zHqLAyXxFQFUUSP32SfpMEfRRzUc=
X-Received: by 2002:a05:6902:1504:b0:e93:47d9:1c53 with SMTP id
 3f1490d57ef6-e9347d91fb8mr7212638276.6.1755520052617; Mon, 18 Aug 2025
 05:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-working_dma_0701_v2-v4-4-62145ab6ea30@riscstar.com> <202508181040.az8RxLrG-lkp@intel.com>
In-Reply-To: <202508181040.az8RxLrG-lkp@intel.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 18 Aug 2025 20:27:21 +0800
X-Gm-Features: Ac12FXyzzS7pnhFgkGl7FiEJKtmHr8DR-5NfS3QvImTcTotkj7TrVuAH6gqFsEk
Message-ID: <CAH1PCMZL-AGJE6PXrpyShYEMFkvoi-Ajzd_Az0ma75QWZFaROQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] dmaengine: mmp_pdma: Add operations structure for
 controller abstraction
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Vinod Koul <vkoul@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_052734_704604_05EC0C7E 
X-CRM114-Status: GOOD (  16.62  )
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

SGksIERhbgoKT24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMzoxN+KAr1BNIERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBIaSBHdW9kb25nLAo+Cj4ga2Vy
bmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxkIHdhcm5pbmdzOgo+Cj4g
dXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0d1
b2RvbmctWHUvZHQtYmluZGluZ3MtZG1hLUFkZC1TcGFjZW1pVC1LMS1QRE1BLWNvbnRyb2xsZXIv
MjAyNTA4MTUtMTMyMDQ5Cj4gYmFzZTogICAwNjJiM2U0YTFmODgwZjEwNGE4ZDRiOTBiNzY3Nzg4
Nzg2YWE3Yjc4Cj4gcGF0Y2ggbGluazogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1
MDgxNS13b3JraW5nX2RtYV8wNzAxX3YyLXY0LTQtNjIxNDVhYjZlYTMwJTQwcmlzY3N0YXIuY29t
Cj4gcGF0Y2ggc3ViamVjdDogW1BBVENIIHY0IDQvOF0gZG1hZW5naW5lOiBtbXBfcGRtYTogQWRk
IG9wZXJhdGlvbnMgc3RydWN0dXJlIGZvciBjb250cm9sbGVyIGFic3RyYWN0aW9uCj4gY29uZmln
OiBwYXJpc2MtcmFuZGNvbmZpZy1yMDcyLTIwMjUwODE4IChodHRwczovL2Rvd25sb2FkLjAxLm9y
Zy8wZGF5LWNpL2FyY2hpdmUvMjAyNTA4MTgvMjAyNTA4MTgxMDQwLmF6OFJ4THJHLWxrcEBpbnRl
bC5jb20vY29uZmlnKQo+IGNvbXBpbGVyOiBocHBhLWxpbnV4LWdjYyAoR0NDKSA4LjUuMAo+Cj4g
SWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90
IGp1c3QgYSBuZXcgdmVyc2lvbiBvZgo+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBh
ZGQgZm9sbG93aW5nIHRhZ3MKPiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4KPiB8IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVy
QGxpbmFyby5vcmc+Cj4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA4
MTgxMDQwLmF6OFJ4THJHLWxrcEBpbnRlbC5jb20vCj4KPiBzbWF0Y2ggd2FybmluZ3M6Cj4gZHJp
dmVycy9kbWEvbW1wX3BkbWEuYzo1NDYgbW1wX3BkbWFfcHJlcF9tZW1jcHkoKSB3YXJuOiB2YXJp
YWJsZSBkZXJlZmVyZW5jZWQgYmVmb3JlIGNoZWNrICdkY2hhbicgKHNlZSBsaW5lIDU0MikKPiBk
cml2ZXJzL2RtYS9tbXBfcGRtYS5jOjcxMiBtbXBfcGRtYV9wcmVwX2RtYV9jeWNsaWMoKSB3YXJu
OiB2YXJpYWJsZSBkZXJlZmVyZW5jZWQgYmVmb3JlIGNoZWNrICdkY2hhbicgKHNlZSBsaW5lIDcw
OCkKPgo+IHZpbSArL2RjaGFuICs1NDYgZHJpdmVycy9kbWEvbW1wX3BkbWEuYwo+Cj4gYzhhY2Q2
YWE2YmVkM2MgWmhhbmdmZWkgR2FvICAgICAyMDEyLTA5LTAzICA1MzYgIHN0YXRpYyBzdHJ1Y3Qg
ZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3IgKgo+IGM4YWNkNmFhNmJlZDNjIFpoYW5nZmVpIEdhbyAg
ICAgMjAxMi0wOS0wMyAgNTM3ICBtbXBfcGRtYV9wcmVwX21lbWNweShzdHJ1Y3QgZG1hX2NoYW4g
KmRjaGFuLAo+IGM4YWNkNmFhNmJlZDNjIFpoYW5nZmVpIEdhbyAgICAgMjAxMi0wOS0wMyAgNTM4
ICAgICAgICAgICAgICAgICAgICAgIGRtYV9hZGRyX3QgZG1hX2RzdCwgZG1hX2FkZHJfdCBkbWFf
c3JjLAo+IGM4YWNkNmFhNmJlZDNjIFpoYW5nZmVpIEdhbyAgICAgMjAxMi0wOS0wMyAgNTM5ICAg
ICAgICAgICAgICAgICAgICAgIHNpemVfdCBsZW4sIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4gYzhh
Y2Q2YWE2YmVkM2MgWmhhbmdmZWkgR2FvICAgICAyMDEyLTA5LTAzICA1NDAgIHsKPiBjOGFjZDZh
YTZiZWQzYyBaaGFuZ2ZlaSBHYW8gICAgIDIwMTItMDktMDMgIDU0MSAgICAgICAgIHN0cnVjdCBt
bXBfcGRtYV9jaGFuICpjaGFuOwo+IDkxOGRhN2VlNTBiMjJiIEd1b2RvbmcgWHUgICAgICAgMjAy
NS0wOC0xNSBANTQyICAgICAgICAgc3RydWN0IG1tcF9wZG1hX2RldmljZSAqcGRldiA9IHRvX21t
cF9wZG1hX2RldihkY2hhbi0+ZGV2aWNlKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXgo+IFRoZSBwYXRjaCBhZGRzIGEgbmV3IGRl
cmVmZXJlbmNlCj4KPiBjOGFjZDZhYTZiZWQzYyBaaGFuZ2ZlaSBHYW8gICAgIDIwMTItMDktMDMg
IDU0MyAgICAgICAgIHN0cnVjdCBtbXBfcGRtYV9kZXNjX3N3ICpmaXJzdCA9IE5VTEwsICpwcmV2
ID0gTlVMTCwgKm5ldzsKPiBjOGFjZDZhYTZiZWQzYyBaaGFuZ2ZlaSBHYW8gICAgIDIwMTItMDkt
MDMgIDU0NCAgICAgICAgIHNpemVfdCBjb3B5ID0gMDsKPiBjOGFjZDZhYTZiZWQzYyBaaGFuZ2Zl
aSBHYW8gICAgIDIwMTItMDktMDMgIDU0NQo+IGM4YWNkNmFhNmJlZDNjIFpoYW5nZmVpIEdhbyAg
ICAgMjAxMi0wOS0wMyBANTQ2ICAgICAgICAgaWYgKCFkY2hhbikKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl4KPiBCdXQg
dGhlIG9sZCBleGlzdGluZyBjb2RlIGFzc3VtZWQgZGNoYW4gY291bGQgYmUgTlVMTAo+CgpUaGFu
ayB5b3UgZm9yIHRoZSByZXBvcnQgYW5kIGZpbmRpbmdzLgpUaGlzIGFuZCB0aGUgbmV4dCBvbmUs
IHRoZXkgYXJlIGJ1Z3MsIGFuZCBJIHdpbGwKZml4IHRoZW0gaW4gdGhlIG5leHQgdmVyc2lvbi4K
CkJSLApHdW9kb25nCgo+IGM4YWNkNmFhNmJlZDNjIFpoYW5nZmVpIEdhbyAgICAgMjAxMi0wOS0w
MyAgNTQ3ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiBjOGFjZDZhYTZiZWQzYyBaaGFu
Z2ZlaSBHYW8gICAgIDIwMTItMDktMDMgIDU0OAo+IGM4YWNkNmFhNmJlZDNjIFpoYW5nZmVpIEdh
byAgICAgMjAxMi0wOS0wMyAgNTQ5ICAgICAgICAgaWYgKCFsZW4pCj4gYzhhY2Q2YWE2YmVkM2Mg
WmhhbmdmZWkgR2FvICAgICAyMDEyLTA5LTAzICA1NTAgICAgICAgICAgICAgICAgIHJldHVybiBO
VUxMOwo+IGM4YWNkNmFhNmJlZDNjIFpoYW5nZmVpIEdhbyAgICAgMjAxMi0wOS0wMyAgNTUxCj4g
YzhhY2Q2YWE2YmVkM2MgWmhhbmdmZWkgR2FvICAgICAyMDEyLTA5LTAzICA1NTIgICAgICAgICBj
aGFuID0gdG9fbW1wX3BkbWFfY2hhbihkY2hhbik7Cj4KPiBbIHNuaXAgXQo+Cj4gMmI3ZjY1YjEx
ZDg3ZjkgSm9lIFBlcmNoZXMgICAgICAyMDEzLTExLTE3ICA3MDEgIHN0YXRpYyBzdHJ1Y3QgZG1h
X2FzeW5jX3R4X2Rlc2NyaXB0b3IgKgo+IDJiN2Y2NWIxMWQ4N2Y5IEpvZSBQZXJjaGVzICAgICAg
MjAxMy0xMS0xNyAgNzAyICBtbXBfcGRtYV9wcmVwX2RtYV9jeWNsaWMoc3RydWN0IGRtYV9jaGFu
ICpkY2hhbiwKPiAyYjdmNjViMTFkODdmOSBKb2UgUGVyY2hlcyAgICAgIDIwMTMtMTEtMTcgIDcw
MyAgICAgICAgICAgICAgICAgICAgICAgICAgZG1hX2FkZHJfdCBidWZfYWRkciwgc2l6ZV90IGxl
biwgc2l6ZV90IHBlcmlvZF9sZW4sCj4gMmI3ZjY1YjExZDg3ZjkgSm9lIFBlcmNoZXMgICAgICAy
MDEzLTExLTE3ICA3MDQgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gZG1hX3RyYW5zZmVy
X2RpcmVjdGlvbiBkaXJlY3Rpb24sCj4gMzFjMWU1YTEzNTBhZTggTGF1cmVudCBQaW5jaGFydCAy
MDE0LTA4LTAxICA3MDUgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxh
Z3MpCj4gNTA0NDBkNzRhYWUzMTggRGFuaWVsIE1hY2sgICAgICAyMDEzLTA4LTIxICA3MDYgIHsK
PiA1MDQ0MGQ3NGFhZTMxOCBEYW5pZWwgTWFjayAgICAgIDIwMTMtMDgtMjEgIDcwNyAgICAgICAg
IHN0cnVjdCBtbXBfcGRtYV9jaGFuICpjaGFuOwo+IDkxOGRhN2VlNTBiMjJiIEd1b2RvbmcgWHUg
ICAgICAgMjAyNS0wOC0xNSBANzA4ICAgICAgICAgc3RydWN0IG1tcF9wZG1hX2RldmljZSAqcGRl
diA9IHRvX21tcF9wZG1hX2RldihkY2hhbi0+ZGV2aWNlKTsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXgo+Cj4KPiA1MDQ0MGQ3NGFh
ZTMxOCBEYW5pZWwgTWFjayAgICAgIDIwMTMtMDgtMjEgIDcwOSAgICAgICAgIHN0cnVjdCBtbXBf
cGRtYV9kZXNjX3N3ICpmaXJzdCA9IE5VTEwsICpwcmV2ID0gTlVMTCwgKm5ldzsKPiA1MDQ0MGQ3
NGFhZTMxOCBEYW5pZWwgTWFjayAgICAgIDIwMTMtMDgtMjEgIDcxMCAgICAgICAgIGRtYV9hZGRy
X3QgZG1hX3NyYywgZG1hX2RzdDsKPiA1MDQ0MGQ3NGFhZTMxOCBEYW5pZWwgTWFjayAgICAgIDIw
MTMtMDgtMjEgIDcxMQo+IDUwNDQwZDc0YWFlMzE4IERhbmllbCBNYWNrICAgICAgMjAxMy0wOC0y
MSBANzEyICAgICAgICAgaWYgKCFkY2hhbiB8fCAhbGVuIHx8ICFwZXJpb2RfbGVuKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5e
Xl5eXgo+IFNhbWUuCj4KPgo+IDUwNDQwZDc0YWFlMzE4IERhbmllbCBNYWNrICAgICAgMjAxMy0w
OC0yMSAgNzEzICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA1MDQ0MGQ3NGFhZTMxOCBE
YW5pZWwgTWFjayAgICAgIDIwMTMtMDgtMjEgIDcxNAo+IDUwNDQwZDc0YWFlMzE4IERhbmllbCBN
YWNrICAgICAgMjAxMy0wOC0yMSAgNzE1ICAgICAgICAgLyogdGhlIGJ1ZmZlciBsZW5ndGggbXVz
dCBiZSBhIG11bHRpcGxlIG9mIHBlcmlvZF9sZW4gKi8KPgo+IC0tCj4gMC1EQVkgQ0kgS2VybmVs
IFRlc3QgU2VydmljZQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
