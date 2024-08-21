Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB28C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 14:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7bMcsIg+7em89myjg0LkA+AOBhP+ATf8cTL4O7fakc=; b=OPBZfYKvSJWNtq
	gRHiOJ7C7TYnCH2Za0g26FLGIl7OtJnsWv0PjH5ttKSJHAe1vIQnel/YX+fSb4TzO/8Iu1kBalEd+
	+zQZhTflU03D+Oi+72vsjvZhSHGADy6RHp3Bt8VXbDrY+xnVEuNoSibybZLfF6yzbu4hK1J+ZrLEq
	VnSdtnVRuV7hofr3zY/gugIyrgBkJnPZ/QafvIKMVG5+xv4AngDerzzo0Mn069O2OI9BiI6Qu+6MR
	LVHvAu4yW96hQSbT7PwwieZ6MF0Ya5rDnBe0hJ3SxKsZjXsGJVz9wAvNRSteGAPtlAVA9R01BOwgz
	UTfe3HVVCL5LIQuPy1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmYm-00000009MPE-2EsZ;
	Wed, 21 Aug 2024 14:43:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmYk-00000009MOL-22kW
	for linux-riscv@bombadil.infradead.org;
	Wed, 21 Aug 2024 14:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YnANlyns677MLgmX5D+5HDeCYuvU+7Zvhaak3tUYSFM=; b=VpIas+mUIK4BIPaCO/2E5YRv+0
	gEbRrO4L0/Wji4tOryULcg0/hMVxvk48aa4AMsev2AJcBqB1nlpZe3l2FzKqyom6otAAtl5VnjhK+
	IJB2xjgstcaMqjKTdv6LlcXtPNcuA6fylhWk+Snvm7aSiY52xrylQ2Bis8VTnPOjxylW5Sy2CqST3
	zE+Zo0tW1EtnucDhfwH9ZjI+esvQEXLjW1lV8BVkNZYGcP/Xfu+fKu5dANIYCshSAc+MbY5msuiEe
	q7rMitXVskZwEgWC8Vgol9ppJLaa66+/IBKqAkIF7BB6qLmbQ1iCC3ppCrO8HvsCkirkyFxH8makn
	m6qyb9sg==;
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmYg-00000009coe-47I5
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 14:43:37 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-39d311d8091so20693305ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 07:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724251411; x=1724856211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnANlyns677MLgmX5D+5HDeCYuvU+7Zvhaak3tUYSFM=;
        b=Wk+UpCVS64bon2EQhxDsfdo7ORk044jZx54xmQy0YMEJX2SHzOU6bD1v3m0dbBQyED
         OFLWr8vreIRU3qCe10auyw5ixw42YmRDh5J/aaDaj/fmbVGxQoiOUNk6qKfmuYhr1jUh
         36B5Tsyurs9hrtHgwjFq/v+M2cFN0/XZkdgnevYRccL0dQFQG0exUS0NgLfzRHxU4Bz1
         5EBsvYVWpUxhARi8JM0+cf6lCc23frwy2njh+PCjQmoJ0CKb1BrEcLxHclpxlht2iqyl
         ezNNB7Z5950vmEsYN2XcZ0wP+laCDISiVh28vpnrpgSbgrI+h/iqD+Hm0tzMomGUPClR
         RNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724251411; x=1724856211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnANlyns677MLgmX5D+5HDeCYuvU+7Zvhaak3tUYSFM=;
        b=XyR64yyfQgMdcufctyDhl2KmMwblAKL9NYBJ/5gZlKsX3XxFEDeHiDMyA8Ss1SEYLu
         G3U3EmSk+ZhEpoyE97lnK+EiCGpAJQY7xGzjNRbmlY0+yLGwRVJqHmsfYWOXNUrSFMpr
         Tl3XPYNJm5n+NguRSME8v9a8vnAw1wKsh5GpujXXQgqPMur4IHi4gvMKJdCoV4UWiM8e
         w9KVVW5RT80ECJkR+Pxa+nobgAQVjBldjfgWZuNt5ASKyHK2mvgtLgZOvPrJrSQNCdlH
         MuSJV2JJVLw8uroKQmlUS6uzOQ5RLug4odyInXC4Y/8bQReGqi96Z2ViAxMs8GijoULs
         5WYw==
X-Forwarded-Encrypted: i=1; AJvYcCWmpy8jDGjlhbOGc6U49zl8BBGpOjHgMiYk90arPZ6o8dP8VRzZQPzBG6jy53YQOGBOW7k27tKHL0LKDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCmxBhwPxAQyJeK5GKcbzYrWb+v3h2acRrP9xqWVy+00D/mCVH
	K8l0YMy+Bl8SXd7ljFDC+mIGMbEjGwYrFUerz2JVL78pZUo+Q6Nn/S21Ktj0s5EkwwpRGfdFOq+
	pdUmVPR/CjsLYruza2ECTFbq/DeSfduwSz0PhVw==
X-Google-Smtp-Source: AGHT+IHJtDUtxCawhOpqM1OVmpuYr/77dmq70s53HK4PjVrBx/OVg/mV1LIwscPOhsReGVgKzxXiUVwufmTAZkEqd5E=
X-Received: by 2002:a05:6e02:1a6a:b0:375:9dd4:d693 with SMTP id
 e9e14a558f8ab-39d6c344cc6mr29305795ab.3.1724251411230; Wed, 21 Aug 2024
 07:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240726084931.28924-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 21 Aug 2024 20:13:20 +0530
Message-ID: <CAAhSdy05BXUZu6BNUoDWoEVd_YiM0Dpqg=t5WYUX7+cacnO2Hg@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] Add Svade and Svadu Extensions Support
To: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_154335_250237_F9BBC8F3 
X-CRM114-Status: GOOD (  25.85  )
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

SGkgUGFsbWVyLAoKT24gRnJpLCBKdWwgMjYsIDIwMjQgYXQgMjoxOeKAr1BNIFlvbmctWHVhbiBX
YW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gU3ZhZGUgYW5kIFN2YWR1
IGV4dGVuc2lvbnMgcmVwcmVzZW50IHR3byBzY2hlbWVzIGZvciBtYW5hZ2luZyB0aGUgUFRFIEEv
RAo+IGJpdC4gV2hlbiB0aGUgUFRFIEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0LCBTdmFkZSBleHRl
bnNpb24gaW50ZGljYXRlcyB0aGF0Cj4gYSByZWxhdGVkIHBhZ2UgZmF1bHQgd2lsbCBiZSByYWlz
ZWQuIEluIGNvbnRyYXN0LCB0aGUgU3ZhZHUgZXh0ZW5zaW9uCj4gc3VwcG9ydHMgaGFyZHdhcmUg
dXBkYXRpbmcgb2YgUFRFIEEvRCBiaXRzLiBUaGlzIHNlcmllcyBlbmFibGVzIFN2YWRlIGFuZAo+
IFN2YWR1IGV4dGVuc2lvbnMgZm9yIGJvdGggaG9zdCBhbmQgZ3Vlc3QgT1MuCj4KPiBSZWdyYWRp
bmcgdGhlIG1haWxpbmcgdGhyZWFkWzFdLCB3ZSBoYXZlIDQgcG9zc2libGUgY29tYmluYXRpb25z
IG9mCj4gdGhlc2UgZXh0ZW5zaW9ucyBpbiB0aGUgZGV2aWNlIHRyZWUsIHRoZSBkZWZhdWx0IGhh
cmR3YXJlIGJlaGF2aW9yIGZvcgo+IHRoZXNlIHBvc3NpYmlsaXRpZXMgYXJlOgo+IDEpIE5laXRo
ZXIgU3ZhZGUgbm9yIFN2YWR1IHByZXNlbnQgaW4gRFQgPT4gSXQgaXMgdGVjaG5pY2FsbHkKPiAg
ICB1bmtub3duIHdoZXRoZXIgdGhlIHBsYXRmb3JtIHVzZXMgU3ZhZGUgb3IgU3ZhZHUuIFN1cGVy
dmlzb3IKPiAgICBzb2Z0d2FyZSBzaG91bGQgYmUgcHJlcGFyZWQgdG8gaGFuZGxlIGVpdGhlciBo
YXJkd2FyZSB1cGRhdGluZwo+ICAgIG9mIHRoZSBQVEUgQS9EIGJpdHMgb3IgcGFnZSBmYXVsdHMg
d2hlbiB0aGV5IG5lZWQgdXBkYXRlZC4KPiAyKSBPbmx5IFN2YWRlIHByZXNlbnQgaW4gRFQgPT4g
U3VwZXJ2aXNvciBtdXN0IGFzc3VtZSBTdmFkZSB0byBiZQo+ICAgIGFsd2F5cyBlbmFibGVkLgo+
IDMpIE9ubHkgU3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1lIFN2
YWR1IHRvIGJlCj4gICAgYWx3YXlzIGVuYWJsZWQuCj4gNCkgQm90aCBTdmFkZSBhbmQgU3ZhZHUg
cHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1lCj4gICAgU3ZhZHUgdHVybmVk
LW9mZiBhdCBib290IHRpbWUuIFRvIHVzZSBTdmFkdSwgc3VwZXJ2aXNvciBtdXN0Cj4gICAgZXhw
bGljaXRseSBlbmFibGUgaXQgdXNpbmcgdGhlIFNCSSBGV0ZUIGV4dGVuc2lvbi4KPgo+IFRoZSBT
dmFkZSBleHRlbnNpb24gaXMgbWFuZGF0b3J5IGFuZCB0aGUgU3ZhZHUgZXh0ZW5zaW9uIGlzIG9w
dGlvbmFsIGluCj4gUlZBMjMgcHJvZmlsZS4gUGxhdGZvcm1zIHdhbnQgdG8gdGFrZSB0aGUgYWR2
YW50YWdlIG9mIFN2YWR1IGNhbiBjaG9vc2UKPiAzLiBUaG9zZSBhcmUgYXdhcmUgb2YgdGhlIHBy
b2ZpbGUgY2FuIGNob29zZSA0LCBhbmQgTGludXggd29uJ3QgZ2V0IHRoZQo+IGJlbmVmaXQgb2Yg
c3ZhZHUgdW50aWwgdGhlIFNCSSBGV0ZUIGV4dGVuc2lvbiBpcyBhdmFpbGFibGUuCj4KPiBbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta2VybmVsLzIwMjQwNTI3LWU5ODQ1YzA2NjE5
YmNhNWNkMjg1MDk4Y0BvcmVsL1QvI20yOTY0NGViODhlMjQxZWMyODJkZjRjY2Q1MTk5NTE0ZTkx
M2IwNmVlCj4KPiAtLS0KPiB2ODoKPiAtIGZpeCB0eXBvIGluIFBBVENIMSAoU2FtdWVsKQo+IC0g
dXNlIHRoZSBuZXcgZXh0ZW5zaW9uIHZhbGlkYXRpbmcgQVBJIGluIFBBVENIMSAoQ2zDqW1lbnQp
Cj4gLSB1cGRhdGUgdGhlIGR0YmluZGluZyBpbiBQQVRDSDIgKFNhbXVlbCwgQ29ub3IpCj4gLSBh
ZGQgUEFUQ0g0IHRvIGZpeCBjb21waWxlIGVycm9yIGluIGdldC1yZWctbGlzdCB0ZXN0Lgo+Cj4g
djc6Cj4gLSBmaXggYWxpZ25tZW50IGluIFBBVENIMQo+IC0gdXBkYXRlIHRoZSBkdGJpbmRpbmcg
aW4gUEFUQ0gyIChDb25vciwgSmVzc2ljYSkKPgo+IHY2Ogo+IC0gcmVmbGVjdCB0aGUgcGxhdGZv
cm0ncyBiZWhhdmlvciBieSByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgpIGFuZAo+ICAg
dXBkYXRlIHRoZSB0aGUgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKCkgaW4gUEFUQ0gxIChDb25vciwg
QW5kcmV3KQo+IC0gdXBkYXRlIHRoZSBkdGJpbmRpbmcgaW4gUEFUQ0gyIChBbGV4YW5kcmUsIEFu
ZHJldywgQW51cCwgQ29ub3IpCj4gLSB1cGRhdGUgdGhlIGhlbnZjZmcgY29uZGl0aW9uIGluIFBB
VENIMyAoQW5kcmV3KQo+IC0gY2hlY2sgaWYgU3ZhZGUgaXMgYWxsb3dlZCB0byBkaXNhYmxlZCBi
YXNlZCBvbiBhcmNoX2hhc19od19wdGVfeW91bmcoKQo+ICAgaW4gUEFUQ0gzCj4KPiB2NToKPiAt
IHJlbW92ZSBhbGwgQWNrZWQtYnkgYW5kIFJldmlld2VkLWJ5IChDb25vciwgQW5kcmV3KQo+IC0g
YWRkIFN2YWRlIHN1cHBvcnQKPiAtIHVwZGF0ZSB0aGUgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKCkg
aW4gUEFUQ0gxCj4gLSB1cGRhdGUgdGhlIGR0YmluZGluZyBpbiBQQVRDSDIgKEFsZXhhbmRyZSwg
QW5kcmV3KQo+IC0gY2hlY2sgdGhlIGF2YWlsaWJpbGl0eSBvZiBTdmFkdSBmb3IgR3Vlc3QvVk0g
YmFzZWQgb24KPiAgIGFyY2hfaGFzX2h3X3B0ZV95b3VuZygpIGluIFBBVENIMwo+Cj4gdjQ6Cj4g
LSBmaXggMzJiaXQga2VybmVsIGJ1aWxkIGVycm9yIGluIFBBVENIMSAoQ29ub3IpCj4gLSB1cGRh
dGUgdGhlIHN0YXR1cyBvZiBTdmFkdSBleHRlbnNpb24gdG8gcmF0aWZpZWQgaW4gUEFUQ0gyCj4g
LSBhZGQgdGhlIFBBVENINCB0byBzdXBvcnJ0IFNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORyBm
b3IgZ3Vlc3QgT1MKPiAtIHVwZGF0ZSB0aGUgUEFUQ0gxIGFuZCBQQVRDSDMgdG8gaW50ZWdyYXRl
IHdpdGggRldGVCBleHRlbnNpb24KPiAtIHJlYmFzZSBQQVRDSDUgb24gdGhlIGxhc3Rlc3QgZ2V0
LXJlZy1saXN0IHRlc3QgKEFuZHJldykKPgo+IHYzOgo+IC0gZml4IHRoZSBjb250cm9sIGJpdCBu
YW1lIHRvIEFEVUUgaW4gUEFUQ0gxIGFuZCBQQVRDSDMKPiAtIHVwZGF0ZSBnZXQtcmVnLWxpc3Qg
aW4gUEFUQ0g0Cj4KPiB2MjoKPiAtIGFkZCBDby1kZXZlbG9wZWQtYnk6IGluIFBBVENIMQo+IC0g
dXNlIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoKSB0byBydW50aW1lIHBhdGNoIHRoZSBi
cmFuY2ggaW4gUEFUQ0gxCj4gLSB1cGRhdGUgZHQtYmluZGluZwo+Cj4gWW9uZy1YdWFuIFdhbmcg
KDUpOgo+ICAgUklTQy1WOiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEV4dGVuc2lvbnMgU3VwcG9ydAo+
ICAgZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEVudHJpZXMKPiAgIFJJ
U0MtVjogS1ZNOiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEV4dGVuc2lvbnMgU3VwcG9ydCBmb3IgR3Vl
c3QvVk0KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogRml4IGNvbXBpbGUgZXJyb3IKPiAgIEtW
TTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFN2YWRlIGFuZCBTdmFkdSBFeHRlbnNpb24gdG8gZ2V0
LXJlZy1saXN0Cj4gICAgIHRlc3QKPgo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwgfCAyOCArKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3YvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jc3IuaCAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAgfCAgMiArKwo+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAgICAgfCAxMyArKysrKysrKy0KPiAgYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgIHwgIDIgKysKPiAgYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgIHwgMTIgKysrKysrKysKPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysrCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysr
KysKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgMTYg
KysrKysrKystLS0KPiAgMTAgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPgo+IC0tCj4gMi4xNy4xCj4KPgoKTGV0IG1lIGtub3cgaWYgdGhpcyBzZXJpZXMg
Y2FuIGJlIHRha2VuIHRocm91Z2ggdGhlIEtWTSBSSVNDLVYgdHJlZS4KSSBjYW4gcHJvdmlkZSB5
b3Ugd2l0aCBhIHNoYXJlZCB0YWcgYXMgd2VsbC4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
