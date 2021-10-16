Return-Path: <SRS0=v6lb=PE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CD9C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 01:12:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5362E60FDA
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 01:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5362E60FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gullnrHf1et9XKYkgpdF4MKeg7eF7ZOorbheRhL83Pg=; b=4eNFYMBKrOmdMMwDYsTPFUpEMD
	4lLsJLqQGH2Hg7wO4TtB1L9VmpKu2nHS+DdxTuyI6ADzLG0B3HScrwlYDWIVpYvVLC/Xgzjikt7BA
	RuKb9jwd25lzdqVFcStHzwja5YaCBVve/k+O1oEaMK8EE70+uNDT3PSeUOEMucTIIl73BHRSod+lv
	e+YJ0S9WQvN5ZSM0GHpC3yBrv1eWsp8uqmGemSlO9/sIiDp6wpstztcDD+37djN+xLz2kNsZt6FVc
	/x1oIZCRDw5OsTvevqUuPRODNoYLEi/5UUwLqgLNsFnSUsu9Cvmt73pEp8SQzSpOfTGVLh1MHAkA1
	DFhYIuPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbYEm-009Rci-7U; Sat, 16 Oct 2021 01:11:48 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbYEi-009Rc4-Vl
 for linux-riscv@lists.infradead.org; Sat, 16 Oct 2021 01:11:47 +0000
Received: by mail-pf1-x42e.google.com with SMTP id g14so9804882pfm.1
 for <linux-riscv@lists.infradead.org>; Fri, 15 Oct 2021 18:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZnmWcpYjZ93+9/USsjI5yc08CI3gidamSDoWKAiSGj8=;
 b=GZKEtGQXS3effH9eTB7DvJ1KHialm9ycCtkHxx+6wj/8ovcnezOgoxlFNi6ojEvxLp
 vCAEn7ozv11GEu8EMAAO6Xf/S0e6bmp47qsDYuHAdVGUM9iRdKA8VHZB3NlFghC7sv46
 FsXw9Erkf/aCnnEl9pWrTbV385gyLs43Hx18EXRAGlUMmVCL2D5ym2Kj2mhtIYRfBIqv
 Qrf9XHbOp6LKOl/7m7BM7QkcqNaIymW4OWH4GuGYKHpLO9HqrVXYSv7jB6TA7NC8DT11
 6sMeUJvndfAQbJjDFrz+sehU5SVlaOfT3aJLAsvtfm2W+JQtKO5tINTrh0I7b0qI/gto
 kCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZnmWcpYjZ93+9/USsjI5yc08CI3gidamSDoWKAiSGj8=;
 b=U58iLGmx5PTasF+t9FFQp+ljLALeqqTD2aKpcMjDUTlIeus8DmZjaFja1cAhrIW6cN
 Zm4S7v/UU8p4PRoh71SpdHD4EMy+ndgVhGgEnA4P5VG8/eRolkzusfrAKGfM1z/xYOk4
 Ia8XxukDd1bI6j7p/YyaYtNMa9fSy2bhVIhII5Jd83dbBCCTeVTOcQVp0k756XoUlcNM
 +9VIAQy8qQn/ZIuoFCcXyU4uYtiGjYI9vkgC+SyDn/vfR6cWF/A+eNda6OvOYl1TcFbF
 pwmYZQzp1hIY5HEdGSp/G5RcEu1usTfk4V5rkkEgn9ILLmistxPxNnY3Q+XRiEC75AbI
 l+3w==
X-Gm-Message-State: AOAM530W+47X8YDT53g81M3Lf37eZqFWHU6u+p3xRZMd+oQ4k93bz0r3
 TlSLPiZeXIMC4/rqIgOJCcyNNw==
X-Google-Smtp-Source: ABdhPJxxfRHsneRsqZjvSmgeS3HDNbLOMcOQWWbfnO+S3BjiB+68l3s3+LJr9/SMhEdp2RjiEUtLoA==
X-Received: by 2002:aa7:8189:0:b0:44c:293a:31e4 with SMTP id
 g9-20020aa78189000000b0044c293a31e4mr14844220pfi.51.1634346702295; 
 Fri, 15 Oct 2021 18:11:42 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id pj12sm6334412pjb.19.2021.10.15.18.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 18:11:41 -0700 (PDT)
Date: Fri, 15 Oct 2021 18:11:41 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Oct 2021 18:11:19 PDT (-0700)
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
In-Reply-To: <afeaea5f-70f2-330f-f032-fb0c8b5d0aa5@ghiti.fr>
CC: nathan@kernel.org, elver@google.com, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, 
 ndesaulniers@google.com, Arnd Bergmann <arnd@arndb.de>,
 kasan-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-8b034488-1592-442a-a206-203c73b3b3bc@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_181145_125478_D8CE310D 
X-CRM114-Status: GOOD (  29.97  )
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

T24gVGh1LCAxNCBPY3QgMjAyMSAxMTozMTowMCBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBIaSBOYXRoYW4sCj4KPiBMZSAxNC8xMC8yMDIxIMOgIDE4OjU1LCBOYXRoYW4gQ2hh
bmNlbGxvciBhIMOpY3JpdMKgOgo+PiBPbiBGcmksIE9jdCAwOCwgMjAyMSBhdCAxMTo0Njo1NUFN
IC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+IE9uIFRodSwgMjMgU2VwIDIwMjEgMDc6
NTk6NDYgUERUICgtMDcwMCksIG5hdGhhbkBrZXJuZWwub3JnIHdyb3RlOgo+Pj4+IE9uIFRodSwg
U2VwIDIzLCAyMDIxIGF0IDEyOjA3OjE3UE0gKzAyMDAsIE1hcmNvIEVsdmVyIHdyb3RlOgo+Pj4+
PiBPbiBXZWQsIDIyIFNlcHQgMjAyMSBhdCAyMjo1NSwgTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4+IEN1cnJlbnRseSwgdGhlIGFzYW4tc3RhY2sgcGFy
YW1ldGVyIGlzIG9ubHkgcGFzc2VkIGFsb25nIGlmCj4+Pj4+PiBDRkxBR1NfS0FTQU5fU0hBRE9X
IGlzIG5vdCBlbXB0eSwgd2hpY2ggcmVxdWlyZXMgS0FTQU5fU0hBRE9XX09GRlNFVCB0bwo+Pj4+
Pj4gYmUgZGVmaW5lZCBpbiBLY29uZmlnIHNvIHRoYXQgdGhlIHZhbHVlIGNhbiBiZSBjaGVja2Vk
LiBJbiBSSVNDLVYncwo+Pj4+Pj4gY2FzZSwgS0FTQU5fU0hBRE9XX09GRlNFVCBpcyBub3QgZGVm
aW5lZCBpbiBLY29uZmlnLCB3aGljaCBtZWFucyB0aGF0Cj4+Pj4+PiBhc2FuLXN0YWNrIGRvZXMg
bm90IGdldCBkaXNhYmxlZCB3aXRoIGNsYW5nIGV2ZW4gd2hlbiBDT05GSUdfS0FTQU5fU1RBQ0sK
Pj4+Pj4+IGlzIGRpc2FibGVkLCByZXN1bHRpbmcgaW4gbGFyZ2Ugc3RhY2sgd2FybmluZ3Mgd2l0
aCBhbGxtb2Rjb25maWc6Cj4+Pj4+Pgo+Pj4+Pj4gZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9v
bWFwZmIvZGlzcGxheXMvcGFuZWwtbGdwaGlsaXBzLWxiMDM1cTAyLmM6MTE3OjEyOgo+Pj4+Pj4g
ZXJyb3I6IHN0YWNrIGZyYW1lIHNpemUgKDE0NDAwKSBleGNlZWRzIGxpbWl0ICgyMDQ4KSBpbiBm
dW5jdGlvbgo+Pj4+Pj4gJ2xiMDM1cTAyX2Nvbm5lY3QnIFstV2Vycm9yLC1XZnJhbWUtbGFyZ2Vy
LXRoYW5dCj4+Pj4+PiBzdGF0aWMgaW50IGxiMDM1cTAyX2Nvbm5lY3Qoc3RydWN0IG9tYXBfZHNz
X2RldmljZSAqZHNzZGV2KQo+Pj4+Pj4gICAgICAgICAgICAgXgo+Pj4+Pj4gMSBlcnJvciBnZW5l
cmF0ZWQuCj4+Pj4+Pgo+Pj4+Pj4gRW5zdXJlIHRoYXQgdGhlIHZhbHVlIG9mIENPTkZJR19LQVNB
Tl9TVEFDSyBpcyBhbHdheXMgcGFzc2VkIGFsb25nIHRvCj4+Pj4+PiB0aGUgY29tcGlsZXIgc28g
dGhhdCB0aGVzZSB3YXJuaW5ncyBkbyBub3QgaGFwcGVuIHdoZW4KPj4+Pj4+IENPTkZJR19LQVNB
Tl9TVEFDSyBpcyBkaXNhYmxlZC4KPj4+Pj4+Cj4+Pj4+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5j
b20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xNDUzCj4+Pj4+PiBSZWZlcmVuY2VzOiA2
YmFlYzg4MGQ3YTUgKCJrYXNhbjogdHVybiBvZmYgYXNhbi1zdGFjayBmb3IgY2xhbmctOCBhbmQg
ZWFybGllciIpCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFu
QGtlcm5lbC5vcmc+Cj4+Pj4+Cj4+Pj4+IFJldmlld2VkLWJ5OiBNYXJjbyBFbHZlciA8ZWx2ZXJA
Z29vZ2xlLmNvbT4KPj4+Pgo+Pj4+IFRoYW5rcyEKPj4+Pgo+Pj4+PiBbIFdoaWNoIHRyZWUgYXJl
IHlvdSBwbGFubmluZyB0byB0YWtlIGl0IHRocm91Z2g/IF0KPj4+Pgo+Pj4+IEdhaCwgSSB3YXMg
aW50ZW5kaW5nIGZvciBpdCB0byBnbyB0aHJvdWdoIC1tbSwgdGhlbiBJIGNjJ2QgbmVpdGhlcgo+
Pj4+IEFuZHJldyBub3IgbGludXgtbW0uLi4gOi8gQW5kcmV3LCBkbyB5b3Ugd2FudCBtZSB0byBy
ZXNlbmQgb3IgY2FuIHlvdQo+Pj4+IGdyYWIgaXQgZnJvbSBMS01MPwo+Pj4KPj4+IEFja2VkLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+Pj4KPj4+IChhc3N1
bWluZyB5b3Ugc3RpbGwgd2FudCBpdCB0aHJvdWdoIHNvbWV3aGVyZSBlbHNlKQo+Pgo+PiBUaGFu
a3MsIGl0IGlzIG5vdyBpbiBtYWlubGluZSBhcyBjb21taXQgMTk1MzI4NjlmZWI5ICgia2FzYW46
IGFsd2F5cwo+PiByZXNwZWN0IENPTkZJR19LQVNBTl9TVEFDSyIpLgo+Pgo+Pj4+PiBOb3RlLCBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2thc2FuLmggbWVudGlvbnMgS0FTQU5fU0hBRE9XX09GRlNF
VCBpbgo+Pj4+PiBjb21tZW50IChjb3BpZWQgZnJvbSBhcm02NCkuIERpZCBSSVNDLVYganVzdCBm
b3JnZXQgdG8gY29weSBvdmVyIHRoZQo+Pj4+PiBLY29uZmlnIG9wdGlvbj8KPj4+Pgo+Pj4+IEkg
ZG8gc2VlIGl0IGRlZmluZWQgaW4gdGhhdCBmaWxlIGFzIHdlbGwgYnV0IHlvdSBhcmUgcmlnaHQg
dGhhdCB0aGV5IGRpZAo+Pj4+IG5vdCBjb3B5IHRoZSBLY29uZmlnIGxvZ2ljLCBldmVuIHRob3Vn
aCBpdCB3YXMgcHJlc2VudCBpbiB0aGUgdHJlZSB3aGVuCj4+Pj4gUklTQy1WIEtBU0FOIHdhcyBp
bXBsZW1lbnRlZC4gUGVyaGFwcyB0aGV5IHNob3VsZCBzbyB0aGF0IHRoZXkgZ2V0Cj4+Pj4gYWNj
ZXNzIHRvIHRoZSBvdGhlciBmbGFncyBpbiB0aGUgImVsc2UiIGJyYW5jaD8KPj4+Cj4+PiBZYSwg
bG9va3MgbGlrZSB3ZSBqdXN0IHNjcmV3ZWQgdGhpcyB1cC4gIEknbSBzZWVpbmcgc29tZSB3YXJu
aW5ncyBsaWtlCj4+Pgo+Pj4gICAgIGNjMTogd2FybmluZzog4oCYLWZzYW5pdGl6ZT1rZXJuZWwt
YWRkcmVzc+KAmSB3aXRoIHN0YWNrIHByb3RlY3Rpb24gaXMgbm90IHN1cHBvcnRlZCB3aXRob3V0
IOKAmC1mYXNhbi1zaGFkb3ctb2Zmc2V0PeKAmSBmb3IgdGhpcyB0YXJnZXQKPj4KPj4gSG1tbSwg
SSB0aG91Z2h0IEkgZGlkIGEgR0NDIGJ1aWxkIHdpdGggdGhpcyBjaGFuZ2UgYnV0IEkgbXVzdCBu
b3QgaGF2ZQo+PiA6Lwo+Pgo+Pj4gd2hpY2ggaXMgaG93IEkgZW5kZWQgdXAgaGVyZSwgSSdtIGFz
c3VtaW5nIHRoYXQncyB3aGF0IHlvdSdyZSB0YWxraW5nIGFib3V0Cj4+PiBoZXJlPyAgTE1LIGlm
IHlvdSB3ZXJlIHBsYW5uaW5nIG9uIHNlbmRpbmcgYWxvbmcgYSBmaXggb3IgaWYgeW91IHdhbnQg
bWUgdG8KPj4+IGdvIGZpZ3VyZSBpdCBvdXQuCj4+Cj4+IEkgdG9vayBhIGxvb2sgYXQgbW92aW5n
IHRoZSBsb2dpYyBpbnRvIEtjb25maWcgbGlrZSBhcm02NCBiZWZvcmUgc2VuZGluZwo+PiB0aGlz
IGNoYW5nZSBhbmQgSSBkaWQgbm90IHJlYWxseSB1bmRlcnN0YW5kIGl0IHdlbGwgZW5vdWdoIHRv
IGRvIHNvLiBJCj4+IHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgaWYgeW91IHdlcmUgYWJsZSB0byBk
byB0aGF0IHNvIHRoYXQgbm90aGluZyBnZXRzCj4+IG1lc3NlZCB1cC4KPj4KPgo+IEknbGwgZG8g
aXQgdG9tb3Jyb3csIEknbSB0aGUgbGFzdCBvbmUgd2hvIHRvdWNoZWQga2FzYW4gb24gcmlzY3Yg
OikKCkFueSBsdWNrPyAgSSB0cmllZCB3aGF0IEkgdGhpbmsgaXMgdGhlIHNpbXBsZSB3YXkgdG8g
ZG8gaXQgbGFzdCB3ZWVrLCAKKG1lcmdpbmcgd2l0aCBMaW51cycgdHJlZSBpcyB0dXJuaW5nIHRo
ZXNlIHdhcm5pbmdzIGludG8gYnVpbGQgCmZhaWx1cmVzKSBidXQgaXQncyBoYW5naW5nIG9uIGJv
b3QuICBOb3Qgc3VyZSB3aGF0J3MgZ29pbmcgb24KCiAgICBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCiAgICBpbmRleCBjM2YzZmQ1ODNlMDQuLmQz
OTk4YjRhNDVmMSAxMDA2NDQKICAgIC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwogICAgKysrIGIv
YXJjaC9yaXNjdi9LY29uZmlnCiAgICBAQCAtMjEyLDYgKzIxMiwxMiBAQCBjb25maWcgUEdUQUJM
RV9MRVZFTFMKICAgICBjb25maWcgTE9DS0RFUF9TVVBQT1JUCiAgICAgICAgICAgIGRlZl9ib29s
IHkKICAgIAogICAgK2NvbmZpZyBLQVNBTl9TSEFET1dfT0ZGU0VUCiAgICArICAgICAgIGhleAog
ICAgKyAgICAgICBkZXBlbmRzIG9uIEtBU0FOX0dFTkVSSUMKICAgICsgICAgICAgZGVmYXVsdCAw
eGRmZmZmZmM4MDAwMDAwMDAgIGlmIDY0QklUCiAgICArICAgICAgIGRlZmF1bHQgMHhmZmZmZmZm
ZiAgICAgICAgICBpZiAzMkJJVAogICAgKwogICAgIHNvdXJjZSAiYXJjaC9yaXNjdi9LY29uZmln
LnNvY3MiCiAgICAgc291cmNlICJhcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhcyIKICAgIAogICAg
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2FzYW4uaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va2FzYW4uaAogICAgaW5kZXggYTJiM2Q5Y2RiYzg2Li5iMDBmNTAzZWMxMjQg
MTAwNjQ0CiAgICAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2thc2FuLmgKICAgICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2FzYW4uaAogICAgQEAgLTMwLDggKzMwLDcgQEAKICAg
ICAjZGVmaW5lIEtBU0FOX1NIQURPV19TSVpFICAgICAgKFVMKDEpIDw8ICgoQ09ORklHX1ZBX0JJ
VFMgLSAxKSAtIEtBU0FOX1NIQURPV19TQ0FMRV9TSElGVCkpCiAgICAgI2RlZmluZSBLQVNBTl9T
SEFET1dfU1RBUlQgICAgIEtFUk5fVklSVF9TVEFSVAogICAgICNkZWZpbmUgS0FTQU5fU0hBRE9X
X0VORCAgICAgICAoS0FTQU5fU0hBRE9XX1NUQVJUICsgS0FTQU5fU0hBRE9XX1NJWkUpCiAgICAt
I2RlZmluZSBLQVNBTl9TSEFET1dfT0ZGU0VUICAgIChLQVNBTl9TSEFET1dfRU5EIC0gKDFVTEwg
PDwgXAogICAgLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICg2NCAtIEtB
U0FOX1NIQURPV19TQ0FMRV9TSElGVCkpKQogICAgKyNkZWZpbmUgS0FTQU5fU0hBRE9XX09GRlNF
VCAgICBfQUMoQ09ORklHX0tBU0FOX1NIQURPV19PRkZTRVQsIFVMKQogICAgCiAgICAgdm9pZCBr
YXNhbl9pbml0KHZvaWQpOwogICAgIGFzbWxpbmthZ2Ugdm9pZCBrYXNhbl9lYXJseV9pbml0KHZv
aWQpOwoKPgo+IFRoYW5rcywKPgo+IEFsZXgKPgo+PiBDaGVlcnMsCj4+IE5hdGhhbgo+Pgo+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
