Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7464AC5472F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 17:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=roWZr6PLocqDbc6IzmeQEx4jJ2hEmpSi5QWb6xsOjAE=; b=UISIqgMRaV9jfq
	aU3DWrFDXelVOufi2VSFUerxWo/PJ/kNknlK0s1cp1LrdgujhjAsczcK9u5iGfp8DODukFQd24eMb
	BbV5e3HtAxycC1yNwM1gMQT/gRY+EIUSkN9cLDyfUjIb8c+ulWBdfPzFh4bhzekugwolxYBuTP3rE
	Y2Yxmp8p8+C689sMTGO8f7ilGb7Ju9zM1rfjZlmTOVaiOOlvXdGr1QFbgNN+q46x8HXplli8z+FWM
	Z6+8fibaR1WhVWsHPRIDDpRUM129tqbS0Y2JspA4RadZGcUOnUK3vRPMyxCCQ9Rby96x8p6uqHr+h
	K81ycck6SQ/X1I68RPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj08B-0000000CKVD-2vvf;
	Tue, 27 Aug 2024 17:37:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj060-0000000CJlK-3Ngy
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 17:35:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2023dd9b86aso45978345ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724780108; x=1725384908; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIb4mBmzYC43N+oUZo7c8o1exbrEwgUhHvaxeKHnwHg=;
        b=fq0E2swDs/ozsmDXjl0pFlC8nVcJ8Af/m5BSO94XF9YJLAan2mp3l6YDB2IBpLUvMm
         RIQeqJodEO8I7WRY6poW7ta/hZfacDfMRkaLRqaviS+eUJV+EfMzdVynKDhhxp4QUpG4
         fgH+LKRD/Jqr3to7LkX7DFFYX7W/J7LjKSjye6MaAPTwv2L9X7JOmRKCwhH3LHTzZv2H
         +ygX+Kl/R7bKtI8FgqyWpq5tuEixRKyd/ApgXyX1PSLDi5RvHMttE2am1QE7rzPlBf/R
         JqIbgxp+Z8eqNlXCPcZkOsgdU0xQLSCUmvpuy7AWfVScYX5NIK/jfhEjBJqF5fhk4chP
         J0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724780108; x=1725384908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIb4mBmzYC43N+oUZo7c8o1exbrEwgUhHvaxeKHnwHg=;
        b=q2jkh4BtEne5nSWLDBDcQWqq39dLHruyTUAvOGyri4RuX3xCeSrxq7pAThhGdfyW0Y
         VyXvNXEvniS60mywkEPCKCTHAS3fIUdY8A2oHv5QCx1sLbHeKnu3Vw7wCtwYR0GOcSfG
         0wCjloaOaKl4S/H0fp1jLcg/ozyk/RTNz8imzKK4qLfjoQWrptSZarp9tjWPHOUMhLbV
         BxSA8VTq8GTYqOTf8rPtpXfgOwcezfDsGvBEutRvdZ80rgzTMxtAmvU7M8ikVt4UQMqz
         qxUgTKErQdl+6R57eJmkXXyDotZvJzBsWIsm6urA8MPNylm1OSFb3otWqZhddOVK9xCl
         Ar2w==
X-Forwarded-Encrypted: i=1; AJvYcCWS+3zw8OKtgIdlsmz0P1djD2aVQUrvRjV5TFr/ETS+1VV2Bbgf4a3SYILnY7zvj8RrXSdUdlHVX7sNNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5QjPgXNGcZh0m6pxzk+ITvITxoGvwStegel4fCo4WpJNT1mNa
	HatH1bB8mqF0PCGrq7dSl6l6Z7vz5SzBo9wMVISvDDc6/YjxpCxIkPOE0nX8l47tzq/4TvxcXPF
	fbhVEAQRADZ9hVm1q/rXC/S149VRdsudYV5+qVg==
X-Google-Smtp-Source: AGHT+IEpoeoH7TOyIaOd7h4fboy+S0nnHcXXeC+zQ9IGno+NEAoMiGlqk67m7SoNWs89YQLWT1K4UhRWn4UViwoutOY=
X-Received: by 2002:a17:90a:9a87:b0:2c7:f3de:27ef with SMTP id
 98e67ed59e1d1-2d646d7fa7emr12752907a91.42.1724780107426; Tue, 27 Aug 2024
 10:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAPYmKFsTcurrUiWqM8cFj+GgqfRiaLqPDGOTSE+RLyKJGSKE2g@mail.gmail.com>
 <B0C91D33-8C1C-4C67-B9B4-41206EFD8ECF@jrtc27.com> <CAPYmKFs7ZyHyKo8uULvYp3YK8ABOJo8+FWDG_cr2YU_cXgfRww@mail.gmail.com>
 <A75E5C30-F062-43A3-A9AF-BB205632C7EC@jrtc27.com>
In-Reply-To: <A75E5C30-F062-43A3-A9AF-BB205632C7EC@jrtc27.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 27 Aug 2024 10:34:56 -0700
Message-ID: <CAH2o1u5bNDpP1Lv1AicEe6uyi5X-ANiApxpvmfBgcxzg4ipH_Q@mail.gmail.com>
Subject: Re: [External] Some feedbacks on RISC-V IOMMU driver
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Xu Lu <luxu.kernel@bytedance.com>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, 
	joro@8bytes.org, LKML <linux-kernel@vger.kernel.org>, 
	Yongji Xie <xieyongji@bytedance.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, wangqian.rd@bytedance.com, 
	linux-riscv <linux-riscv@lists.infradead.org>, robin.murphy@arm.com, 
	Hangjing Li <lihangjing@bytedance.com>, baolu.lu@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_103508_874714_D6B9735D 
X-CRM114-Status: GOOD (  38.63  )
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

SGkgSmVzc2ljYSBhbmQgWHUsCgpPbiBNb24sIEF1ZyAxOSwgMjAyNCBhdCAxMToyN+KAr0FNIEpl
c3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4KPiBPbiAxOSBBdWcgMjAy
NCwgYXQgMDg6NDksIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+
Cj4gPiBIaSBKZXNzaWNhLAo+ID4KPiA+IE9uIE1vbiwgQXVnIDE5LCAyMDI0IGF0IDE6MTfigK9Q
TSBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpydGMyNy5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24g
MTkgQXVnIDIwMjQsIGF0IDA0OjU2LCBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPj4+Cj4gPj4+IEhpIFRvbWFzeiwKPiA+Pj4KPiA+Pj4gVGhhbmtzIGZvciB5b3Vy
IGJyaWxsaWFudCBqb2Igb24gUklTQy1WIElPTU1VIGRyaXZlci4gSXQgaGVscHMgdXMgYQo+ID4+
PiBsb3QgZm9yIHdoYXQgd2UgYXJlIGRvaW5nLiBCZWxvdyBpcyBvdXIgZmVlZGJhY2sgb24gdGhl
IGV4aXN0aW5nCj4gPj4+IGltcGxlbWVudGF0aW9uWzFdLgo+ID4+Pgo+ID4+PiAxKSBTb21lIElP
TU1VIEhXIG1heSBvbmx5IHN1cHBvcnQgMzItYml0IGdyYW51bGFyaXR5IGFjY2VzcyBvbiBpdHMK
PiA+Pj4gY29udHJvbCByZWdpc3RlcnMgKGV2ZW4gd2hlbiB0aGUgcmVnaXN0ZXIgaXMgOCBieXRl
IGxlbmd0aCkuIE1heWJlIGl0Cj4gPj4+IGlzIGJldHRlciB0byBwcm92aWRlIGEgMzItYml0IGFj
Y2VzcyBtZXRob2QgZm9yIDggYnl0ZSBsZW5ndGgKPiA+Pj4gcmVnaXN0ZXJzIGxpa2Ugd2hhdCBv
cGVuc2JpIGRvZXMgb24gQUNMSU5UIE1USU1FIHJlZ2lzdGVyLgo+ID4+Cj4gPj4gVGhhdCBPcGVu
U0JJIGhhcyB0byBhY2Nlc3MgTVRJTUUgcGllY2V3aXNlIGlzIGEgd29ya2Fyb3VuZCBmb3IgYSB2
ZW5kb3IKPiA+PiBub3QgaW1wbGVtZW50aW5nIHdoYXQgdGhlIHNwZWMgY2xlYXJseSBpbnRlbmRl
ZCwgZXZlbiBpZiBpdCB3YXNu4oCZdAo+ID4+IGV4cGxpY2l0bHkgc3RhdGVkIChidXQgaXMgbm93
LCBpbiByZXNwb25zZSB0byB0aGF0KS4gUmVwZWF0aW5nIHRoYXQKPiA+PiBzaXR1YXRpb24gd291
bGQgYmUgYSBwaXRpZnVsIG1pc3Rha2UuCj4gPj4KPiA+PiBUaGUgY3VycmVudCBJT01NVSBzcGVj
IGRyYWZ0IHZlcnkgY2xlYXJseSBzdGF0ZXM6Cj4gPj4KPiA+PiAgIlJlZ2lzdGVycyB0aGF0IGFy
ZSA2NC1iaXQgd2lkZSBtYXkgYmUgYWNjZXNzZWQgdXNpbmcgZWl0aGVyIGEgMzItYml0Cj4gPj4g
ICBvciBhIDY0LWJpdCBhY2Nlc3Mu4oCdCj4gPj4KPiA+Cj4gPiBUaGUgc3BlYydzIGRlc2NyaXB0
aW9uIGFib3V0IHRoaXMgaXMgcHJldHR5IGNvbmZ1c2luZy4KPiA+ICJUaGUgOCBieXRlIElPTU1V
IHJlZ2lzdGVycyBhcmUgZGVmaW5lZCBpbiBzdWNoIGEgd2F5IHRoYXQgc29mdHdhcmUKPiA+IGNh
biBwZXJmb3JtIHR3byBpbmRpdmlkdWFsIDQgYnl0ZSBhY2Nlc3Nlcywgb3IgaGFyZHdhcmUgY2Fu
IHBlcmZvcm0KPiA+IHR3byBpbmRlcGVuZGVudCA0IGJ5dGUgdHJhbnNhY3Rpb25zIHJlc3VsdGlu
ZyBmcm9tIGFuIDggYnl0ZSBhY2Nlc3MuIgo+ID4gSXQgc2VlbXMgdGhhdCB0aGVyZSBpcyBubyBy
ZXF1aXJlbWVudCB0byBpbXBsZW1lbnQgOC1ieXRlIGFjY2Vzcy4KPiA+IEl0J3MgT0sgdGhlbiBp
ZiB3ZSB0aGluayB0aGlzIGlzIG5vdCBhIHByb2JsZW0uCj4KPiBJIGFncmVlIHRoYXQgcGFydCBp
cyBwb29ybHkgd29yZGVkLiBUaGUgcGFydCBJIHF1b3RlZCAoZnJvbSBTb2Z0d2FyZQo+IGd1aWRl
bGluZXMpIGlzIGNsZWFyIG9uIHRoZSBtYXR0ZXIgdGhvdWdoLiBNeSBpbnRlcnByZXRhdGlvbiBv
ZiB0aGUKPiBwYXJ0IHlvdSBxdW90ZWQgaXMgdGhhdCB0aGUgc3BlYyBoYXMgYmVlbiB3cml0dGVu
IHN1Y2ggdGhhdCBzb2Z0d2FyZQo+IGNhbiBjaG9vc2UgdG8gYnJlYWsgOC1ieXRlIGFjY2Vzc2Vz
IGludG8gdHdvIDQtYnl0ZSBvbmVzIGFuZCB0aGluZ3MKPiB3aWxsIHdvcmssIGJ1dCBpZiBpdCBk
b2VzbuKAmXQgKHdoaWNoIGlzIGEgdmFsaWQgZHJpdmVyIGltcGxlbWVudGF0aW9uKSwKPiBoYXJk
d2FyZSBjYW4gYWxzbyBkbyBzbyBzaG91bGQgaXQgbm90IHdhbnQgdG8gc3VwcG9ydCBhbiA4LWJ5
dGUKPiBpbnRlcmZhY2UgKGUuZy4geW91IGhhdmUgYSA0LWJ5dGUgSS9PIGJ1cykuCj4KCkknZCBh
ZGQgdG8gdGhlIHF1b3RlZCBzcGVjIHRoZSByZW1haW5pbmcgcGFydCBvZiB0aGUgc2VudGVuY2U6
CiJUaGUgOCBieXRlIElPTU1VIHJlZ2lzdGVycyAuLi4uIDggYnl0ZSBhY2Nlc3MsIHRvIHRoZSBo
aWdoIGFuZCBsb3cKaGFsdmVzIG9mIHRoZSByZWdpc3RlciBhcyBsb25nIGFzIHRoZSByZWdpc3Rl
ciBzZW1hbnRpY3MsIHdpdGggcmVnYXJkcwp0byBzaWRlLWVmZmVjdHMsIGFyZSByZXNwZWN0ZWQg
YmV0d2VlbiB0aGUgdHdvIHNvZnR3YXJlIGFjY2Vzc2VzLCBvcgp0d28gaGFyZHdhcmUgdHJhbnNh
Y3Rpb25zLCByZXNwZWN0aXZlbHkiCgpJZiBJL08gYnVzIGxpbWl0cyBhY2Nlc3MgdG8gNC1ieXRl
IHRyYW5zZmVycywgcmVzcGVjdGluZyBkZXNjcmliZWQKb3JkZXJpbmc6ICJ0aGUgaGlnaCBhbmQg
bG93IGhhbHZlcyIsIHNob3VsZCBub3QgY3JlYXRlIGFueQpzaWRlLWVmZmVjdHMgb24gdGhlIElP
TU1VIGhhcmR3YXJlIChtb3N0bHkgRERUUCByZWdpc3RlciBhY2Nlc3MpLiBJZgp0aGVyZSBpcyBh
IHVzZSBjYXNlIHdoZXJlIGhhcmR3YXJlIGlzIG5vdCBhYmxlIHRvIHNwbGl0IDgtYnl0ZSBhY2Nl
c3MKaW50byA0LWJ5dGUgdHJhbnNhY3Rpb25zLCBtYWNyb3MgZGVmaW5lZCBpbiBpby02NC1ub25h
dG9taWMtaGktbG8uaAp3b3VsZCBoZWxwIGhlcmUgYW5kIG90aGVyIGRldmljZSBkcml2ZXJzLgoK
PiBKZXNzCj4KPiA+PiBKZXNzCj4gPj4KPiA+Pj4gMikgSW4gdGhlIElPTU1VIGZhdWx0IHF1ZXVl
IGhhbmRsaW5nIHByb2NlZHVyZSwgSSB3b25kZXIgd2hldGhlciBpdCBpcwo+ID4+PiBiZXR0ZXIg
dG8gY2xlYXIgdGhlIGZxbWYvZnFvZiBiaXQgZmlyc3QsIGFuZCB0aGVuIGNsZWFyIHRoZSBpcHNy
LmZpcAo+ID4+PiBiaXQuIE90aGVyd2lzZSB0aGUgaXBzci5maXAgY2FuIG5vdCBiZSBjbGVhcmVk
IGFuZCBhIHJlZHVuZGFudAo+ID4+PiBpbnRlcnJ1cHQgd2lsbCBiZSBzaWduYWxlZC4KPiA+Cj4g
PiBCeSB0aGUgd2F5LCBpdCBzZWVtcyB0aGUgaXJxIGhhbmRsZXIgbXVzdCBjbGVhciBpcHNyLmZp
cCBmaXJzdCB0bwo+ID4gYXZvaWQgbWlzc2luZyBvdXQgc29tZSBmYXVsdHMgbm8gbWF0dGVyIHdo
ZXRoZXIgYSByZWR1bmRhbnQgaXJxIHdpbGwKPiA+IGJlIGdlbmVyYXRlZC4KPiA+Cj4gPiBJZiBp
cHNyLmZpcSBwZW5kaW5nIHZpYSBmcW9mL2ZxbWYgaXMgaW1wbGVtZW50ZWQgYXMgZWRnZSB0cmln
Z2VyaW5nLAo+ID4gdGhlbiBpcHNyLmZpcSBjYW4gYmUgY2xlYXJlZCBhdCBmaXJzdC4gSW4gdGhp
cyBjYXNlIHdlIGNhbiBub3QgY2xlYXIKPiA+IGlwc3IuZmlwIGFnYWluIGFmdGVyIGNsZWFyaW5n
IGZxb2YvZnFtZiBiaXQsIGFzIGl0IGluZGljYXRlcyBhIG5ldwo+ID4gZmF1bHQgdG8gYmUgaGFu
ZGxlZC4KPiA+Cj4gPiBJZiBpcHNyLmZpcSBwZW5kaW5nIHZpYSBmcW9mL2ZxbWYgaXMgaW1wbGVt
ZW50ZWQgYXMgbGV2ZWwgdHJpZ2dlcmluZywKPiA+IHRoZW4gaXBzci5maXEgY2FuIG5vdCBiZSBj
bGVhcmVkIGF0IGZpcnN0IGFuZCBhIHJlZHVuZGFudCBpcnEgd2lsbCBiZQo+ID4gZ2VuZXJhdGVk
IGFmdGVyIHRoaXMgaGFuZGxlcidzIHJldHVybi4gQnV0IGl0IGlzIE9LIGFzIG5vIGZhdWx0IHdp
bGwKPiA+IGJlIG1pc3NlZC4gT3RoZXJ3aXNlIGl0IGlzIGhhcmQgdG8gZGV0ZWN0IHdoZXRoZXIg
dGhlIGlwc3IuZmlxIGlzIGFuCj4gPiBvbGQgb25lIG9yIGEgbmV3IG9uZS4KPiA+Cj4gPiBQbGVh
c2UgY29ycmVjdCBtZSBpZiBJIGhhdmUgYW55IG1pc3VuZGVyc3RhbmRpbmcuIExvb2tpbmcgZm9y
d2FyZCB0bwo+ID4gdGhlIHN1YnNlcXVlbnQgY29kZS4KPiA+CgpDb3JyZWN0LiBUaGUgZ29hbCBv
ZiBjbGVhcmluZyBGSVAgZmlyc3Qgd2FzIG5vdCB0byBtaXNzIGZhdWx0LAphY2NlcHRpbmcgcmVk
dW5kYW50IGludGVycnVwdHMgdG8gYmUgZ2VuZXJhdGVkIGluIGhvcGVmdWxseSByYXJlCmNhc2Vz
LiBUbyBiZSBob25lc3QsIGhhbmRsaW5nIGZxb2YvZnFtZiBmYXVsdHMgd2lsbCBwcm9iYWJseSB0
cmlnZ2VyCmVuZHBvaW50IGFuZC9vciBJT01NVSBkZXZpY2UgcXVpZXNjZSBhbnl3YXksIGFuZCB2
ZXJ5IGxpa2VseSBtb3JlCmZhdWx0IHJlcG9ydHMsIGFzIHRoZSBzdGF0ZSBvZiB0aGUgZGV2aWNl
L3N5c3RlbSBpbiBzdWNoIGNhc2VzIGlzCmFscmVhZHkgc3VzcGVjdGVkLgoKPiA+IEJlc3QgcmVn
YXJkcyEKPiA+Cj4gPj4+Cj4gPj4+IEJlc3QgcmVnYXJkcyEKPiA+Pj4gWHUgTHUKPiA+Pj4KPiA+
Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNzE4Mzg4OTA4LmdpdC50
amV6bmFjaEByaXZvc2luYy5jb20vCj4gPj4+Cj4gPj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
ID4+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPj4+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgo+CgpUaGFuayB5b3Ug
Zm9yIHlvdXIgZmVlZGJhY2ssIGFuZCBzb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksIHN0aWxsCmNh
dGNoaW5nIHVwIG9uIGVtYWlscy4KCkJlc3QsCi0gVG9tYXN6CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
