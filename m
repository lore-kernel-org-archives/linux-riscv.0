Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CCFE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 19:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+t3PpJbhyhOjCoNhd4+yNqDoujzu8vQGIVqeFcS1IZA=; b=KY+GhUxR6U98NE
	CP+kRkeCeWQw1md7DCCunDgi5xFAFh4feNnr+pi5Aewuyf+F4+Agauq7HrAl8MueAcRX6+VBhs3ur
	om/ZZMActCLHOC2nMlYE4aoCcYTfYIhz1CMME+fXh24nwT1S90t09k245q9ZtNqmfEQTXlGG7ScRn
	vrzwNqzWpOQvyeq8sK77ZeXUyPqUwOqeiFOMhF+czo+swoBIBvG+8Kn9OQ+zm810GsPpMUX+jElSd
	Up6av6Oq0aw7zldqvoQ/nFLceFymG5WqFidr1s0KTTZ6b2vPjC7GVUwRCfRMxXKJcvkd4dQhMFVs0
	YYdipTr9YYPUSO4pCagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmcl-00000009Xtc-09RE;
	Tue, 14 Jan 2025 19:30:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmZj-00000009XOy-0p0K
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 19:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ES4PfYVi7ZyhgRUm9GYH+FMCnEy4+AUcUAHWe5oV5jA=; b=HmvJxjwEU/xspRhsK5Df36KL61
	rak8pSe4P0gDcNJAmOa2L7SHM6HJSQa35d191cyvJuHDpnS7cClTL6n8jnc45IlL6BE63CyZdgGhn
	4W9XRuVqZZx8TdxiflgzvRsNDhIxaSKPVfegWJ9Y/RqpemQIrJVJJlzPQfd1i2Se+KDxafswhZJB3
	lzzkEf2xHYi8oYGrhzGfykfanTdreXnj7/QsNQeeYZvuSCJEqVGwP44HUwm0AHsy57pGYZgbqsBkn
	ynFXnSIIPmD1WDhvXAcqlNfaozs8vNNMqyoyWMYkHZR/7I1/b1EyGwL0xww4xXb4uAzLKZW7hb7nu
	iJ1BOvoA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmZf-0000000Aa87-3Z9P
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 19:27:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-218c8aca5f1so127177295ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 11:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736882857; x=1737487657; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ES4PfYVi7ZyhgRUm9GYH+FMCnEy4+AUcUAHWe5oV5jA=;
        b=V/JM1qwzn62BqvpvP4waV3zfslLKf0wDq/W46N8LhLwDn/ujpVMq2sqXCeAUZBLTpm
         yRVmqRtfVX8jOnbmA/hNYvdt61XefOvo6BJpL17wengxbUc9/B1edd0JPkfA0igvXMyU
         PiCdf1ejvBw/auCeJ5eMOlAJw9j3bpOfGi+p3VBBDzdUs8a5EqW8j83fA9sd4LX53clA
         9nV8BPHu4ozNUBzkCnvut0DFXFRdw001kgRsknJ4EWxtGXTbgGmy/ynJGazebAs3gzCh
         7EkDJYlMESzz+AWTsRyJpOCkb+ARKDi9lFuRfwq415URFqinTCbomP8OvLxupHuO33cq
         ihKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882857; x=1737487657;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ES4PfYVi7ZyhgRUm9GYH+FMCnEy4+AUcUAHWe5oV5jA=;
        b=ADwGEJd/nw+iLLG9GCnKw1eAcQJsRTH5RXt8igEJ4f8ny4/adbKXlm7w+2/gFAiG+R
         0Oxpw+j+aBjFWFZTUHWt6QAuq3dudcR5jH+rSLhc4X7lqJElmc4VtieTivc2kelrymYG
         PBvM9reyICK08DnAoBdwNZt8Vxad7zs5DlE9ZSD6HSQSQg0qUAWev8b79YJIEtVnRWAI
         xExMrXQbHevbhk+yPhzjWhDjC4e1S1xsD3y3zpQsImJ4D5oNN83wmYbQF7+ssGLxurHk
         JJQFqw9BhXinvcTpcW1P3O/1Z2hedKcKqbkPFH1tA6PQvHlE0pwa/hJQi0Sw7Jlx8BOZ
         fL7w==
X-Forwarded-Encrypted: i=1; AJvYcCVMQXyV0c5rzbyaoOVmZE9FNiut+RZHFJ5ZtoOtiT3nSeNMqqZIgM11RK2pbiFOFgiMooX4atYJjw+e0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxHMbxOsICADcKx6NF/lV6I3LyPKUv92Ep6a7IRmfMimTfqmH2
	RTdi/b2/zUBrFz9VBK7AAGv8snzWISKYC3MGWS8SRA1J4XXXCiVs+oSpgj+dJ4A=
X-Gm-Gg: ASbGncvTWZax4shdMEhLswr2C05+R15VouMkkWhbfkcLj3iowIZGvKfzaGfJcOdfFsU
	tUWR/jZpSC/q5HsiDHxKgeDsoJv4gsuQll5V3l8vLb3XSk7+QG18yw9XYFLZZ8FFZCGmLqWSISZ
	rXZJ0QavZ5xPcsF1o41dl5wWnI9750JN61B4ZnLxFjbzirWqnA1tluAWrmjhgwVJJf5VsN3gZfI
	2NhlIi+ijVNsuJ8r06VTyJiHaP2FtG5Xmg9grGldcdM09Fien60
X-Google-Smtp-Source: AGHT+IHNba0GEbibje0t5wLZKfmTow6LQxoYMbmUndt+PVUCx5IeqgXnaaRg1lp0Qu+9TDj1PY7X3A==
X-Received: by 2002:a17:902:d4cd:b0:216:3c2b:a5e5 with SMTP id d9443c01a7336-21a83f71115mr361190955ad.27.1736882856927;
        Tue, 14 Jan 2025 11:27:36 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:c3be:2c11:1223:572a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10e006sm70578375ad.1.2025.01.14.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:27:34 -0800 (PST)
Date: Tue, 14 Jan 2025 11:27:30 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z4a6oivg7f74N12Q@ghost>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
 <Z4BEygdXmofWBr0-@x1>
 <Z4BVK3D7sN-XYg2o@ghost>
 <Z4F1dXQLPGZ3JFI5@ghost>
 <Z4UpRqywqYPZSUM_@x1>
 <Z4alwvqYithaVLSL@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4alwvqYithaVLSL@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_192740_199921_50058A0C 
X-CRM114-Status: GOOD (  39.54  )
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

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMDI6NTg6MjZQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IE9uIE1vbiwgSmFuIDEzLCAyMDI1IGF0IDExOjU1OjA1QU0gLTAz
MDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPiA+IE9uIEZyaSwgSmFuIDEwLCAy
MDI1IGF0IDExOjMxOjAxQU0gLTA4MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4gT24g
VGh1LCBKYW4gMDksIDIwMjUgYXQgMDM6MDA6NTlQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5zIHdy
b3RlOgo+ID4gPiA+IE9vaCBva2F5IEkgc2VlLCB0aGUgcXVpZXQgY29tbWFuZHMgd2VyZSBiZWlu
ZyBpZ25vcmVkIGFzLWlzLiBXZSBjb3VsZAo+ID4gPiA+IGFkZCB0aGUgbGluZXMgdG8gaGFuZGxl
IHRoaXMgdG8gTWFrZWZpbGUuc3lzY2FsbHMsIGJ1dCBJIHRoaW5rIHRoZQo+ID4gPiA+IGJldHRl
ciBzb2x1dGlvbiBpcyB0byBtb3ZlIHRoZSBsaW5lcyBmcm9tIE1ha2VmaWxlLmJ1aWxkIHRvCj4g
PiA+ID4gTWFrZWZpbGUucGVyZiB0byBiZSBtb3JlIGdlbmVyaWNhbGx5IGF2YWlsYWJsZS4gSGVy
ZSBpcyBhIHBhdGNoIGZvcgo+ID4gPiA+IHRoYXQuIEkgYWxzbyBhZGRlZCB0aGUgY29tbWVudCBm
cm9tIHRoZSBrZXJuZWwgTWFrZWZpbGUgZGVzY3JpYmluZyB3aGF0Cj4gPiA+ID4gdGhpcyBkb2Vz
Lgo+ID4gCj4gPiA+ID4gRnJvbSA4ZGNlYzdmNWQ5MzdlZGUzZDMzYzY4NzU3M2RjMmYxNjU0ZGRj
NTllIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gPiA+IEZyb206IENoYXJsaWUgSmVua2lu
cyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gPiA+ID4gRGF0ZTogVGh1LCA5IEphbiAyMDI1IDE0
OjM2OjQwIC0wODAwCj4gPiA+ID4gU3ViamVjdDogW1BBVENIXSBwZXJmIHRvb2xzOiBFeHBvc2Ug
cXVpZXQvdmVyYm9zZSB2YXJpYWJsZXMgaW4gTWFrZWZpbGUucGVyZgo+ID4gPiA+IAo+ID4gPiA+
IFRoZSB2YXJpYWJsZXMgdG8gbWFrZSBidWlsZHMgc2lsZW50L3ZlcmJvc2UgbGl2ZSBpbnNpZGUK
PiA+ID4gPiB0b29scy9idWlsZC9NYWtlZmlsZS5idWlsZC4gTW92ZSB0aG9zZSB2YXJpYWJsZXMg
dG8gdGhlIHRvcC1sZXZlbAo+ID4gPiA+IE1ha2VmaWxlLnBlcmYgdG8gYmUgZ2VuZXJhbGx5IGF2
YWlsYWJsZS4KPiA+IAo+ID4gPFNOSVAgYXBwbGllZCBwYXRjaD4KPiA+ICAKPiA+ID4gTGV0IG1l
IGtub3cgaG93IHlvdSB3YW50IHRvIGhhbmRsZSB0aGlzLCBJIGNhbiBzZW5kIHRoaXMgb3V0IGFz
IGEKPiA+ID4gc2VwYXJhdGUgcGF0Y2ggaWYgdGhhdCdzIGJldHRlci4KPiA+IAo+ID4gSSB1c2Vk
IHRoZSBwYXRjaCB5b3UgcHJvdmlkZWQgYWJvdmUgYWZ0ZXIgaGFuZCBlZGl0aW5nIHRoZSBtZXNz
YWdlCj4gPiBiZWZvcmUgZmVlZGluZyBpdCB0byAnZ2l0IGFtJywgYWRkZWQgdGhlc2UgY29tbWVu
dHM6Cj4gCj4gU29tZWhvdyB0aGlzIGlzIGNhdXNpbmcgc29tZSB0cm91YmxlOgo+IAo+IOKsoiBb
YWNtZUB0b29sYm94IHBlcmYtdG9vbHMtbmV4dF0kIG1ha2UgLUMgdG9vbHMvcGVyZiBidWlsZC10
ZXN0Cj4gbWFrZTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xz
LW5leHQvdG9vbHMvcGVyZicKPiAtIHRhcnBrZzogLi90ZXN0cy9wZXJmLXRhcmd6LXNyYy1wa2cg
Lgo+IC9iaW4vc2g6IGxpbmUgMTogQG1ha2U6IGNvbW1hbmQgbm90IGZvdW5kCj4gbWFrZVs0XTog
KioqIFtNYWtlZmlsZToyNzogY2xlYW4tYXNtX3B1cmVfbG9vcF0gRXJyb3IgMTI3Cj4gbWFrZVsz
XTogKioqIFtNYWtlZmlsZS5wZXJmOjc2NDogdGVzdHMtY29yZXNpZ2h0LXRhcmdldHMtY2xlYW5d
IEVycm9yIDIKPiBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjk2OiBjbGVhbl0gRXJyb3IgMgo+IG1h
a2VbMV06ICoqKiBbdGVzdHMvbWFrZTozMzA6IG1ha2Vfc3RhdGljXSBFcnJvciAyCj4gbWFrZTog
KioqIFtNYWtlZmlsZToxMDk6IGJ1aWxkLXRlc3RdIEVycm9yIDIKPiBtYWtlOiBMZWF2aW5nIGRp
cmVjdG9yeSAnL2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYnCj4g4qyi
IFthY21lQHRvb2xib3ggcGVyZi10b29scy1uZXh0XSQKPiAKPiBDYW4geW91IHBsZWFzZSB0cnkg
Zml4aW5nIGl0IGFzIEknbSBidXN5IG5vdyAoSSdsbCBiZSBvbiB2YWNhdGlvbiBmcm9tCj4gdG9t
b3Jyb3cgdGlsbCBlYXJseSBGZWJydWFyeSk/IFRoaXMgaXMgd2hhdCBJIGV4dHJhY3RlZDoKClRo
ZXJlIHdhcyBhbiBlcnJvbmVvdXMgJChRKSBpbgp0b29scy9wZXJmL3Rlc3RzL3NoZWxsL2NvcmVz
aWdodC9NYWtlZmlsZS4gUHJldmlvdXNseSBpdCB3b3VsZCBleHBhbmQgdG8KdGhlIGVtcHR5IHN0
cmluZyBzbyB3b3VsZG4ndCBjYXVzZSBhbnkgcHJvYmxlbXMsIGJ1dCBub3cgaXQncyBpbiB0aGUK
bWlkZGxlIG9mIGFuIGV4cHJlc3Npb24gc28gaGVuY2UgdGhlIGVycm9yLiBJJ2xsIHNlbmQgYW4g
dXBkYXRlZCBwYXRjaC4KCj4gCj4gY29tbWl0IGMxOTlmZDc4NWQxODEyMWZmZDBiYTU3NThlMjNh
NDJiYTI5ODRlMTEKPiBBdXRob3I6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5j
b20+Cj4gRGF0ZTogICBNb24gSmFuIDEzIDExOjUwOjU1IDIwMjUgLTAzMDAKPiAKPiAgICAgcGVy
ZiB0b29sczogRXhwb3NlIHF1aWV0L3ZlcmJvc2UgdmFyaWFibGVzIGluIE1ha2VmaWxlLnBlcmYK
PiAgICAgCj4gICAgIFRoZSB2YXJpYWJsZXMgdG8gbWFrZSBidWlsZHMgc2lsZW50L3ZlcmJvc2Ug
bGl2ZSBpbnNpZGUKPiAgICAgdG9vbHMvYnVpbGQvTWFrZWZpbGUuYnVpbGQuIE1vdmUgdGhvc2Ug
dmFyaWFibGVzIHRvIHRoZSB0b3AtbGV2ZWwKPiAgICAgTWFrZWZpbGUucGVyZiB0byBiZSBnZW5l
cmFsbHkgYXZhaWxhYmxlLgo+ICAgICAKPiAgICAgQ29tbWl0dGVyIHRlc3Rpbmc6Cj4gICAgIAo+
ICAgICBTZWUgdGhlIFNZU0NBTEwgbGluZXMsIG5vdyB0aGV5IGFyZSBjb25zaXN0ZW50IHdpdGgg
dGhlIG90aGVyCj4gICAgIG9wZXJhdGlvbnMgaW4gb3RoZXIgbGluZXM6Cj4gICAgIAo+ICAgICAg
IFNZU1RCTCAgL3RtcC9idWlsZC9wZXJmLXRvb2xzLW5leHQvYXJjaC94ODYvaW5jbHVkZS9nZW5l
cmF0ZWQvYXNtL3N5c2NhbGxzXzMyLmgKPiAgICAgICBTWVNUQkwgIC90bXAvYnVpbGQvcGVyZi10
b29scy1uZXh0L2FyY2gveDg2L2luY2x1ZGUvZ2VuZXJhdGVkL2FzbS9zeXNjYWxsc182NC5oCj4g
ICAgICAgR0VOICAgICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9jb21tb24tY21kcy5oCj4g
ICAgICAgR0VOICAgICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9hcmNoL2FybTY0L2luY2x1
ZGUvZ2VuZXJhdGVkL2FzbS9zeXNyZWctZGVmcy5oCj4gICAgICAgUEVSRl9WRVJTSU9OID0gNi4x
My5yYzIuZzNkOTRiYjZlZDFkMAo+ICAgICAgIEdFTiAgICAgcGVyZi1hcmNoaXZlCj4gICAgICAg
TUtESVIgICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9qdm10aS8KPiAgICAgICBNS0RJUiAg
IC90bXAvYnVpbGQvcGVyZi10b29scy1uZXh0L2p2bXRpLwo+ICAgICAgIE1LRElSICAgL3RtcC9i
dWlsZC9wZXJmLXRvb2xzLW5leHQvanZtdGkvCj4gICAgICAgTUtESVIgICAvdG1wL2J1aWxkL3Bl
cmYtdG9vbHMtbmV4dC9qdm10aS8KPiAgICAgICBHRU4gICAgIHBlcmYtaW9zdGF0Cj4gICAgICAg
Q0MgICAgICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9qdm10aS9saWJqdm10aS5vCj4gICAg
ICAgQ0MgICAgICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9qdm10aS9qdm10aV9hZ2VudC5v
Cj4gICAgIAo+ICAgICBSZXBvcnRlZC1ieTogQXJuYWxkbyBDYXJ2YWxobyBkZSBNZWxvIDxhY21l
QHJlZGhhdC5jb20+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+Cj4gICAgIFRlc3RlZC1ieTogQXJuYWxkbyBDYXJ2YWxobyBkZSBNZWxv
IDxhY21lQHJlZGhhdC5jb20+Cj4gICAgIENjOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVy
QGludGVsLmNvbT4KPiAgICAgQ2M6IEFsZXhhbmRlciBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNo
a2luQGxpbnV4LmludGVsLmNvbT4KPiAgICAgQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4gICAgIENjOiBDaHJpc3RpYW4gQnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3JnPgo+ICAg
ICBDYzogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gICAgIENjOiBHw7xudGhlciBOb2Fj
ayA8Z25vYWNrQGdvb2dsZS5jb20+Cj4gICAgIENjOiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2ds
ZS5jb20+Cj4gICAgIENjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KPiAgICAgQ2M6
IEphbWVzIENsYXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3JnPgo+ICAgICBDYzogSmlyaSBPbHNh
IDxqb2xzYUBrZXJuZWwub3JnPgo+ICAgICBDYzogSm9obiBHYXJyeSA8am9obi5nLmdhcnJ5QG9y
YWNsZS5jb20+Cj4gICAgIENjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0Pgo+ICAg
ICBDYzogTGVvIFlhbiA8bGVvLnlhbkBsaW51eC5kZXY+Cj4gICAgIENjOiBNYXJrIFJ1dGxhbmQg
PG1hcmsucnV0bGFuZEBhcm0uY29tPgo+ICAgICBDYzogTWlja2HDq2wgU2FsYcO8biA8bWljQGRp
Z2lrb2QubmV0Pgo+ICAgICBDYzogTWlrZSBMZWFjaCA8bWlrZS5sZWFjaEBsaW5hcm8ub3JnPgo+
ICAgICBDYzogTmFtaHl1bmcgS2ltIDxuYW1oeXVuZ0BrZXJuZWwub3JnPgo+ICAgICBDYzogUGFs
bWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiAgICAgQ2M6IFBhdWwgV2FsbXNsZXkg
PHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KPiAgICAgQ2M6IFBldGVyIFppamxzdHJhIDxwZXRl
cnpAaW5mcmFkZWFkLm9yZz4KPiAgICAgQ2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+
Cj4gICAgIExpbms6IGh0dHA6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9Ob25lCj4gICAgIFNpZ25l
ZC1vZmYtYnk6IEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyA8YWNtZUByZWRoYXQuY29tPgo+IAo+
IGRpZmYgLS1naXQgYS90b29scy9idWlsZC9NYWtlZmlsZS5idWlsZCBiL3Rvb2xzL2J1aWxkL01h
a2VmaWxlLmJ1aWxkCj4gaW5kZXggNWZiM2ZiM2Q5N2UwZmQxMS4uZTcxMGVkNjdhMWI0OWQ5ZiAx
MDA2NDQKPiAtLS0gYS90b29scy9idWlsZC9NYWtlZmlsZS5idWlsZAo+ICsrKyBiL3Rvb2xzL2J1
aWxkL01ha2VmaWxlLmJ1aWxkCj4gQEAgLTEyLDI2ICsxMiw2IEBACj4gIFBIT05ZIDo9IF9fYnVp
bGQKPiAgX19idWlsZDoKPiAgCj4gLWlmZXEgKCQoViksMSkKPiAtICBxdWlldCA9Cj4gLSAgUSA9
Cj4gLWVsc2UKPiAtICBxdWlldD1xdWlldF8KPiAtICBRPUAKPiAtZW5kaWYKPiAtCj4gLSMgSWYg
dGhlIHVzZXIgaXMgcnVubmluZyBtYWtlIC1zIChzaWxlbnQgbW9kZSksIHN1cHByZXNzIGVjaG9p
bmcgb2YgY29tbWFuZHMKPiAtIyBtYWtlLTQuMCAoYW5kIGxhdGVyKSBrZWVwIHNpbmdsZSBsZXR0
ZXIgb3B0aW9ucyBpbiB0aGUgMXN0IHdvcmQgb2YgTUFLRUZMQUdTLgo+IC1pZmVxICgkKGZpbHRl
ciAzLiUsJChNQUtFX1ZFUlNJT04pKSwpCj4gLXNob3J0LW9wdHMgOj0gJChmaXJzdHdvcmQgLSQo
TUFLRUZMQUdTKSkKPiAtZWxzZQo+IC1zaG9ydC1vcHRzIDo9ICQoZmlsdGVyLW91dCAtLSUsJChN
QUtFRkxBR1MpKQo+IC1lbmRpZgo+IC0KPiAtaWZuZXEgKCQoZmluZHN0cmluZyBzLCQoc2hvcnQt
b3B0cykpLCkKPiAtICBxdWlldD1zaWxlbnRfCj4gLWVuZGlmCj4gLQo+ICBidWlsZC1kaXIgOj0g
JChzcmN0cmVlKS90b29scy9idWlsZAo+ICAKPiAgIyBEZWZpbmUgJChmaXhkZXApIGZvciBkZXAt
Y21kIGZ1bmN0aW9uCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvTWFrZWZpbGUucGVyZiBiL3Rv
b2xzL3BlcmYvTWFrZWZpbGUucGVyZgo+IGluZGV4IGE0NDlkMDAxNTUzNjQ0MjIuLjU1ZDZjZTll
YTUyZmIyYTUgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcGVyZi9NYWtlZmlsZS5wZXJmCj4gKysrIGIv
dG9vbHMvcGVyZi9NYWtlZmlsZS5wZXJmCj4gQEAgLTE2MSwxMiArMTYxLDQ3IEBAIGV4cG9ydCBW
UEFUSAo+ICBTT1VSQ0UgOj0gJChzaGVsbCBsbiAtc2YgJChzcmN0cmVlKS90b29scy9wZXJmICQo
T1VUUFVUKS9zb3VyY2UpCj4gIGVuZGlmCj4gIAo+ICsjIEJlYXV0aWZ5IG91dHB1dAo+ICsjIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICsjCj4gKyMgTW9zdCBvZiBidWlsZCBjb21tYW5kcyBpbiBLYnVp
bGQgc3RhcnQgd2l0aCAiY21kXyIuIFlvdSBjYW4gb3B0aW9uYWxseSBkZWZpbmUKPiArIyAicXVp
ZXRfY21kXyoiLiBJZiBkZWZpbmVkLCB0aGUgc2hvcnQgbG9nIGlzIHByaW50ZWQuIE90aGVyd2lz
ZSwgbm8gbG9nIGZyb20KPiArIyB0aGF0IGNvbW1hbmQgaXMgcHJpbnRlZCBieSBkZWZhdWx0Lgo+
ICsjCj4gKyMgZS5nLikKPiArIyAgICBxdWlldF9jbWRfZGVwbW9kID0gREVQTU9EICAkKE1PRExJ
QikKPiArIyAgICAgICAgICBjbWRfZGVwbW9kID0gJChzcmN0cmVlKS9zY3JpcHRzL2RlcG1vZC5z
aCAkKERFUE1PRCkgJChLRVJORUxSRUxFQVNFKQo+ICsjCj4gKyMgQSBzaW1wbGUgdmFyaWFudCBp
cyB0byBwcmVmaXggY29tbWFuZHMgd2l0aCAkKFEpIC0gdGhhdCdzIHVzZWZ1bAo+ICsjIGZvciBj
b21tYW5kcyB0aGF0IHNoYWxsIGJlIGhpZGRlbiBpbiBub24tdmVyYm9zZSBtb2RlLgo+ICsjCj4g
KyMgICAgJChRKSQoTUFLRSkgJChidWlsZCk9c2NyaXB0cy9iYXNpYwo+ICsjCj4gKyMgVG8gcHV0
IG1vcmUgZm9jdXMgb24gd2FybmluZ3MsIGJlIGxlc3MgdmVyYm9zZSBhcyBkZWZhdWx0Cj4gKyMg
VXNlICdtYWtlIFY9MScgdG8gc2VlIHRoZSBmdWxsIGNvbW1hbmRzCj4gKwo+ICBpZmVxICgkKFYp
LDEpCj4gKyAgcXVpZXQgPQo+ICAgIFEgPQo+ICBlbHNlCj4gLSAgUSA9IEAKPiArICBxdWlldD1x
dWlldF8KPiArICBRPUAKPiAgZW5kaWYKPiAgCj4gKyMgSWYgdGhlIHVzZXIgaXMgcnVubmluZyBt
YWtlIC1zIChzaWxlbnQgbW9kZSksIHN1cHByZXNzIGVjaG9pbmcgb2YgY29tbWFuZHMKPiArIyBt
YWtlLTQuMCAoYW5kIGxhdGVyKSBrZWVwIHNpbmdsZSBsZXR0ZXIgb3B0aW9ucyBpbiB0aGUgMXN0
IHdvcmQgb2YgTUFLRUZMQUdTLgo+ICtpZmVxICgkKGZpbHRlciAzLiUsJChNQUtFX1ZFUlNJT04p
KSwpCj4gK3Nob3J0LW9wdHMgOj0gJChmaXJzdHdvcmQgLSQoTUFLRUZMQUdTKSkKPiArZWxzZQo+
ICtzaG9ydC1vcHRzIDo9ICQoZmlsdGVyLW91dCAtLSUsJChNQUtFRkxBR1MpKQo+ICtlbmRpZgo+
ICsKPiAraWZuZXEgKCQoZmluZHN0cmluZyBzLCQoc2hvcnQtb3B0cykpLCkKPiArICBxdWlldD1z
aWxlbnRfCj4gK2VuZGlmCj4gKwo+ICtleHBvcnQgcXVpZXQgUQo+ICsKPiAgIyBEbyBub3QgdXNl
IG1ha2UncyBidWlsdC1pbiBydWxlcwo+ICAjICh0aGlzIGltcHJvdmVzIHBlcmZvcm1hbmNlIGFu
ZCBhdm9pZHMgaGFyZC10by1kZWJ1ZyBiZWhhdmlvdXIpOwo+ICBNQUtFRkxBR1MgKz0gLXIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
