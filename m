Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0C3CD4F52
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfjU66U8Qq2/DIjvRVeE9tMzTyTv4ifRPnHupDIsdNM=; b=bB24yaShXN8Eh/
	DuqmpBqJCMn78KE/ljdewYBRyAQFdFnuuC+GBPY7dkZ3BIQNmNcCSym1zRK/OXbssN1BzOkTCQexq
	xAMYzzthSiScqg6QzMKx3qKXwbLosQhtnJdjMn5UFItIGlly85657e4KBJetIvhHyjvngtgXEEKhR
	DKAQQuR8Yojw3DVcYWCo5Mb6uAo2yoniyY4xRkKS5Zvq/4XSZ2wBOBF8uRCmVYB+kLNpZQgUdsjpD
	DeRXBo/4EM/o+3pETtTvawSAnqdvtJyIy1dtjsneFHnCR2Hj+RxC9ojEAFOkNO+dGXBBTz6bwP7CO
	MvOkMpTSTY6s9SrqOJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFiC-00000000ePt-01Hf;
	Tue, 19 May 2026 08:22:00 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFi9-00000000eOE-1UCK
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 08:21:58 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-43aaeb6c96bso760001fac.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 01:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779178916; cv=none;
        d=google.com; s=arc-20240605;
        b=folHsBkbikEsR1M3YbLSir5VFSp9wPQFs4TcmVEsPaXOEckMXc6YLis2CVwX991z+k
         rTRTW5eCunYZDc2o0m3/r0aCgpeOs0YWY2xe1WIViZnDU4g/2qpqFmAEEZnZT7S3y+JI
         D0Mz2WUkDq9g1FrCbJcvPMuuoJ5zKlJJdvUSY9txNGIwDc4R+XX9jcIlgp2d9sD6riPw
         Bs1z44rIUGO++F4IKT203w/Nrc3Gv5ORO7JSOGExICGSORvWg0ClhfoXmokQcTWiW5I2
         vzlB9E3SYznY3/MBCvAzydokTXGpvJCVwqeprZokRrTlQf3QoP9SxpUdh/UAOKbWqRpp
         HYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tbApDUE9otXvL0QjjtLdk1qVbJM8P4jzKOK5sf0GKA0=;
        fh=+o8K8PB41SzcEXcDSCQLB0QvVqyo9PfVBIxPm4Wl/k8=;
        b=E+SAPbjY8NdXnPPYxX//ffMGxMOiqUFV1gV/CYu0TBLyiSoBAND0e5H4CpJt2ET1C6
         Dz3++GJ3YaZAr70B3s+mpTpovs9ZIA8fegAPwv1s3WcWBRt5FeQ5hxaJAAvVDf3n2Uhg
         WzF9Zu6THxEMvm0zmUJt6yGnQSKkKI87iCJtouOK0aQcjdv98Vwnc8jT5iXbk5CKa/LM
         mhP60cAgdADwEaOt0PAbzYJb75PpSXURYpmnBTQABQR4I7hghOqld1Hr3Wmg5xoPrZGJ
         wxkEgJFA8Rtqez6Jy6c8M7l434fUpgofbg3rkLb6aOUS8kXeChOXYn3DHWFLY6HeBHGx
         N1EA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779178916; x=1779783716; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbApDUE9otXvL0QjjtLdk1qVbJM8P4jzKOK5sf0GKA0=;
        b=DeHr5UwU08hk6QiDSIN7y6lNM8RV+dEYY5XgXyvC1fy7svzXYU//Ymy8KSHutHheZ9
         kjH0deSk1pobDMYDT5W/ETVehFHvM1azQy1RDS5jMBDRaq+7v6koVyCWONSxNeLWx0Bs
         dQU+yUxH6f0Jlao1iOvoUYyZDl2jBJv+3YwPI6F3+bCFeCbFcZKzQKhL6xjb/MJ8v9+5
         bkYtuadskt8Vf5oMWZxdHx6t6bNubmhzPklWYSCD+U6L9ceT20k014l4WG3UsKQo1s4A
         DfJqgkobzjZVUjQPyuWE6eMuZDfBQ5SLE3oPAZoG5n45o7u9zqzMhSKGW6tKzkWFbZ6r
         8ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178916; x=1779783716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tbApDUE9otXvL0QjjtLdk1qVbJM8P4jzKOK5sf0GKA0=;
        b=YzT0DNrCUV5mv05FMSmtAgaeYnrbfUFArzif0xDpAcnLFRFRy9o+TGrLf7gsfBxCnI
         dQLcYtIxRi/7uO+y8m5W0mAUE1DTST5CdKrLbCTBGNaHFg7P4nHRTJSx1FFHbSAL6X30
         k1hmGxYRdyMhwwIP98vHL68RaoertNeChivDWbgoUIBKvm4iECIEI/LC4nusC15D9yn8
         O/JknWa+x2lE/eWfoBMiOsRivXmkCWFIe5dAO9wLrqPk8vSSAcfwp3CENuiVP5Yh2/XM
         s5OxOz1+MkXRrRC1BCGQpeSwxt6ePdNC8QqrVmZ0K3qH+XOZFoyVBUh5JJ7r53bcwrlm
         KwxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8W2lS/xqYG43dBjykqKCUEoMcgpJQFlgpJwsCo+Jk9/efGcl8BjiZwS3IGZh73BrY6DtHq1Y2tT0vo2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCgfXhBvm3WVYXHa7LoPwhudLR/27zztkulJpKpby/fYwzMrdV
	2Yb670RngHd7HKCojCwhZctDTISksnzvPwc7gjgJo+tlC2CuJQLDcLF+AyooUQpHWuuzCt6N1Uo
	JiQbuovAckLts3nHbl77v5aAizfFN6qCeFHJ3JrxR4A==
X-Gm-Gg: Acq92OEnDCypwTUlR63RBnswFhfPTsbzO3bGz+i3eajfj10XMh00R6hDdYjWBE91zEp
	sSD1ukvJuSF0LBMidbBygrIkwYSfq7brZTe+mbXG22vNPLn2DXNfH1II97sAZrP3wRiwhUIlxxA
	CQp2BmecLw+63ZkU3LO+0lJDzCwVEisNfNJaDws8kSIRznyjnoxEjHE0C88jHeDsY9aVX4FJdQN
	/QOxZNC+TdXusRrw5/4f3Iw94CC53vJPliFWTU+hpNCHF6q1GLlKjq0vc7xBvGQPzVNpvL/LKC3
	S8WawdYHCVgWiCi6SxxuE2OOecsDmKBgZYbeOTnio6L8gFOw/bUoMSDfdtsUKT5I3VbZDySGjYh
	MkCN6z7JoMmwg4CRGXlhd1yaFlSdbmUFyb4ZNHg==
X-Received: by 2002:a05:6820:20e:b0:67c:1e60:3e90 with SMTP id
 006d021491bc7-69c94331f33mr12185683eaf.6.1779178915753; Tue, 19 May 2026
 01:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 19 May 2026 13:51:43 +0530
X-Gm-Features: AVHnY4JFgKnIatwx3Ei-NvI3Uzi9URU6n-MEUMadrpHdmyDax9RT0kMAxHJilm0
Message-ID: <CAAhSdy34AvYZNKDiXErv3k4OBgaJ7K-ZMQ18GEHtbqONpbh3zA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Linux RISC-V trace framework and drivers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Mayuresh Chitale <mchitale@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anup Patel <anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_012157_542020_820C3D3B 
X-CRM114-Status: GOOD (  29.99  )
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

SGkgR3JlZywKCk9uIFdlZCwgQXByIDI5LCAyMDI2IGF0IDY6MjHigK9QTSBBbnVwIFBhdGVsIDxh
bnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgYWRkcyBp
bml0aWFsIHN1cHBvcnQgZm9yIFJJU0MtViB0cmFjZSBmcmFtZXdvcmsgYW5kIGRyaXZlcnMuCj4g
VGhlIFJJU0MtViB0cmFjZSB2MS4wIHNwZWNpZmljYXRpb24gaXMgYWxyZWFkeSByYXRpZmllZCBh
bmQgY2FuIGJlIGZvdW5kIGF0Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL2Ut
dHJhY2UtZW5jYXAvcmVsZWFzZXMvdGFnL3YxLjAuMC1yYXRpZmllZAo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi1ub24taXNhL3RnLW5leHVzLXRyYWNlL3JlbGVhc2VzL3RhZy8xLjBfUmF0aWZp
ZWQKPgo+IFRoZSBSSVNDLVYgdHJhY2UgZnJhbWV3b3JrIGFuZCBkcml2ZXJzIGFyZSBkZXNpZ25l
ZCB0byBiZSBhZ25vc3RpYyB0byB0aGUKPiB1bmRlcmx5aW5nIHRyYWNlIHByb3RvY29sIGhlbmNl
IGJvdGggUklTQy1WIEUtdHJhY2UgYW5kIFJJU0MtViBOLXRyYWNlIHNob3VsZAo+IHdvcmsgZmlu
ZS4gVGhlIGRpc2NvdmVyeSBvZiB0cmFjZSBwcm90b2NsIHBhcmFtZXRlcnMgYXJlIGxlZnQgdG8g
dXNlci1zcGFjZQo+IHRyYWNlIGRlY29kZXIuCj4KPiBJbiB0aGVyIGZ1dHVyZSwgdGhlcmUgd2ls
bCBiZSBzdWJzZXF1ZW50IHNlcmllcyBhZGRpbmc6Cj4gMSkgU3lzZnMgc3VwcG9ydAo+IDIpIEFD
UEkgc3VwcG9ydAo+IDMpIE1vcmUgdHJhY2UgZHJpdmVycyAoc3VjaCBhcyBmdW5uZWwsIEFUQiwg
ZXRjKQo+IDQpIFN1cHBvcnQgZm9yIHVwY29taW5nIHNlbGYtaG9zdGVkIHRyYWNlIHNwZWNpZmlj
YXRpb24KPiA1KSAuLi4gYW5kIG1vcmUgLi4uCj4KPiBUaGVzZSBwYXRjaGVzIGNhbiBhbHNvIGJl
IGZvdW5kIGluIHRoZSByaXNjdl90cmFjZV9zdXBwb3J0X3YzIGJyYW5jaCBhdDoKPiBodHRwczov
L2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPgo+IFRvIHRlc3QgdGhlIHBhdGNoZXMsIHdl
IG5lZWQgUUVNVSB2aXJ0IG1hY2hpbmUgd2l0aCBSSVNDLVYgdHJhY2Ugc3VwcG9ydAo+IHdoaWNo
IGNhbiBiZSBmb3VuZCBpbiBydi1ldHJhY2UgYnJhbmNoIGF0Ogo+IGh0dHBzOi8vZ2l0bGFiLmNv
bS9kYW5pZWxoYi9xZW11LmdpdAo+Cj4gVG8gY2FwdHVyZSBydnRyYWNlIGRhdGEgdXNpbmcgcGVy
ZiBvbiBRRU1VIHZpcnQgbWFjaGluZSBkbyB0aGUgZm9sbG93aW5nOgo+IDEpIExhdW5jaCBRRU1V
IHZpcnQgbWFjaGluZQo+ICAgICQgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtbm9ncmFwaGljIC1NIHZp
cnQgLXNtcCAyIC1iaW9zIGZ3X2R5bmFtaWMuYmluIFwKPiAgICAgIC1rZXJuZWwgSW1hZ2UgLWFw
cGVuZCAicm9vdD0vZGV2L3ZkYSBydyBjb25zb2xlPXR0eVMwIGVhcmx5Y29uPXNiaSIgXAo+ICAg
ICAgLWRyaXZlIGZpbGU9L3BhdGgvdG8vcm9vdGZzLmltZyxpZD1kaXNrMSxpZj1ub25lLGZvcm1h
dD1yYXcgXAo+ICAgICAgLWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1kaXNrMQo+IDIp
IFJ1biBwZXJmIHJlY29yZCB0byBjYXB0dXJlIHJ2dHJhY2UgZGF0YQo+ICAgICQgcGVyZiByZWNv
cmQgLS1hbGwtY3B1cyAtZSBydnRyYWNlL2V2ZW50PTB4MS8gPGNvbW1hbmQ+Cj4gMykgVGhlIHN0
ZXAyIHdvdWxkIGNyZWF0ZSBhIHBlcmYuZGF0YSBmaWxlIHdoaWNoIGhhcyB0aGUgcnZ0cmFjZSBk
YXRhLgo+ICAgIE5vdyBydW4gcGVyZiByZXBvcnQgLUQgYW5kIGxvb2sgZm9yIFBFUkZfUkVDT1JE
X0FVWFRSQUNFIGV2ZW50Cj4gICAgc2VjdGlvbihzKSB3aGljaCBwb2ludChzKSB0byB0aGUgYWN0
dWFsIHJ2dHJhY2UgZGF0YSBvZmZzZXQuCj4KPiBDaGFuZ2VzIHNpbmNlIHYzOgo+ICAtIFJlYmFz
ZWQgb24gTGludXgtNy4xLXJjMQo+ICAtIFVzZSBremFsbG9jX29iaigpIGluLXBsYWNlIG9mIGt6
YWxsb2MoKSBpbiBQQVRDSDIsIFBBVENIMyBhbmQgUEFUQ0g5Cj4gIC0gSW1wcm92ZWQgUEFUQ0g3
IHRvIHNhdmUgdGhlIHByZXZpb3VzIFdQIHZhbHVlCj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAt
IFJlYmFzZWQgb24gTGludXgtNy4wLXJjMQo+ICAtIEFkZHJlc3NlZCBSb2IncyBjb21tZW50cyBv
biBEVCBiaW5kaW5ncyBpbiBQQVRDSDEKPiAgLSBBZGRyZXNzZWQgcmVmLWNvdW50IHJlbGF0ZWQg
aXNzdWVzIGluIHJ2dHJhY2Vfb2ZfcGFyc2Vfb3V0Y29ubnMoKQo+ICAgIG9mIFBBVENIMgo+ICAt
IE1hZGUgUlZ0cmFjZSBmcmFtZXdvcmsgbW9yZSBnZW5lcmljIGJ5IGF2b2lkaW5nIGltcGxpY2l0
IGFjY2Vzcwo+ICAgIHRvIGNvbXBvbmVudCByZWdpc3RlcnMgaW4gUEFUQ0gyCj4gIC0gTW9yZSBp
bXByb3ZlbWVudHMgaW4gdHJSYW1TdGFydC9MaW1pdC9XUCBwcm9ncmFtbWluZyBhbmQgb3RoZXIK
PiAgICBpbXByb3ZtZW50cyBpbiBQQVRDSDcKPiAgLSBSZW1vdmVkIFJWVFJBQ0VfQlVGX0xFTiBm
cm9tIFBBVENIOQo+ICAtIFJlbW92ZWQgcmVkdW5kYW50IHBhZ2Vfc2l6ZSBmcm9tIFBBVENIMTAK
PiAgLSBSZW5hbWVkIGZvdW5kX2V0bSBpbiBQQVRDSDEwCj4gIC0gUmVtb3ZlZCBydnRyYWNlX3Jl
Y29yZGluZ19pbml0KCkgZGVjbGFyYXRpb24gZnJvbSBoZWFkZXIgaW4gUEFUQ0gxMQo+Cj4gQ2hh
bmdlcyBzaW5jZSB2MToKPiAgLSBSZWJhc2VkIG9uIExpbnV4LTYuMTgtcmMzCj4gIC0gQWRkcmVz
c2VkIFJvYidzIGNvbW1lbnRzIGluIGR0LWJpbmRpbmdzIGFkZGVkIGJ5IFBBVENIMQo+ICAtIEdl
dCByZWZlcmVuY2Ugb2YgY29ubi0+ZGVzdF9md25vZGUgYW5kIGFkZCBtaXNzaW5nIGJyZWFrIGlu
Cj4gICAgcnZ0cmFjZV9vZl9wYXJzZV9vdXRjb25ucygpIG9mIHJ2dHJhY2UtcGxhdGZvcm0gZHJp
dmVycyBhZGRlZAo+ICAgIGJ5IFBBVENIMgo+ICAtIEFkZGVkIG5ldyBpbmxpbmUgZnVuY3Rpb24g
cnZ0cmFjZV9jb21wX2lzX2VtcHR5KCkgaW4gUEFUQ0gyCj4gICAgYW5kIHVzZWQgaXQgaW4gcnZ0
cmFjZV9lbmNvZGVyX3N0b3AoKSBhZGRlZCBieSBQQVRDSDUKPiAgLSBGaXhlZCB0clJhbVdQTG93
IHVzYWdlIGluIFBBVENINwo+ICAtIERldGVybWluZSBSQU0gc2luayBidWZmZXIgc2l6ZSBiYXNl
ZCBvbiBjb21wb25lbnQgaW1wbGVtZW50YXRpb24KPiAgICBJRCBhbmQgcmVkdWNlIGRlZmF1bHQg
UkFNIHNpbmsgYnVmZmVyIHNpemUgdG8gMU1CCj4gIC0gQWRkIG5ldyBQQVRDSDggdG8gZW5hYmxl
IERNQV9SRVNUUklDVEVEX1BPT0wgaW4gUklTQy1WIGRlZmNvbmZpZwo+ICAgIHNvIHRoYXQgaW1w
bGVtZW50YXRpb25zIHdpdGggUkFNIHNpbmsgYWRkcmVzcyByZXN0cmljdGlvbnMgY2FuCj4gICAg
YmUgaGFuZGxlZC4KPgo+IEFudXAgUGF0ZWwgKDYpOgo+ICAgZHQtYmluZGluZ3M6IEFkZCBSSVND
LVYgdHJhY2UgY29tcG9uZW50IGJpbmRpbmdzCj4gICBydnRyYWNlOiBJbml0aWFsIGltcGxlbWVu
dGF0aW9uIG9mIGRyaXZlciBmcmFtZXdvcmsKPiAgIHJ2dHJhY2U6IEFkZCBmdW5jdGlvbnMgdG8g
Y3JlYXRlL2Rlc3Ryb3kgYSB0cmFjZSBjb21wb25lbnQgcGF0aAo+ICAgcnZ0cmFjZTogQWRkIGZ1
bmN0aW9uIHRvIGNvcHkgaW50byBwZXJmIEFVWCBidWZmZXIKPiAgIHJpc2N2OiBFbmFibGUgRE1B
X1JFU1RSSUNURURfUE9PTCBpbiBkZWZjb25maWcKPiAgIE1BSU5UQUlORVJTOiBBZGQgZW50cnkg
Zm9yIFJJU0MtViB0cmFjZSBmcmFtZXdvcmsKPgo+IE1heXVyZXNoIENoaXRhbGUgKDYpOgo+ICAg
cnZ0cmFjZTogQWRkIGZ1bmN0aW9ucyB0byBzdGFydC9zdG9wIHRyYWNpbmcgb24gYSBjb21wb25l
bnQgcGF0aAo+ICAgcnZ0cmFjZTogQWRkIHRyYWNlIGVuY29kZXIgZHJpdmVyCj4gICBydnRyYWNl
OiBBZGQgdHJhY2UgcmFtc2luayBkcml2ZXIKPiAgIHJ2dHJhY2U6IEFkZCBwZXJmIGRyaXZlciBm
b3IgdHJhY2luZyB1c2luZyBwZXJmIHRvb2wKPiAgIHBlcmYgdG9vbHM6IEFkZCBSSVNDLVYgdHJh
Y2UgUE1VIHJlY29yZCBjYXBhYmlsaXRpZXMKPiAgIHBlcmYgdG9vbHM6IEluaXRpYWwgc3VwcG9y
dCBmb3IgUklTQy1WIHRyYWNlIGRlY29kZXIKPgo+ICAuLi4vYmluZGluZ3MvcmlzY3YvcmlzY3Ys
dHJhY2UtY29tcG9uZW50LnlhbWwgfCAxMjAgKysrCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSArCj4gIGFyY2gvcmlzY3YvY29uZmlncy9kZWZj
b25maWcgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvaHd0cmFjaW5nL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gIGRyaXZlcnMvaHd0cmFjaW5nL3J2dHJh
Y2UvS2NvbmZpZyAgICAgICAgICAgICB8ICAzMyArCj4gIGRyaXZlcnMvaHd0cmFjaW5nL3J2dHJh
Y2UvTWFrZWZpbGUgICAgICAgICAgICB8ICAgNiArCj4gIGRyaXZlcnMvaHd0cmFjaW5nL3J2dHJh
Y2UvcnZ0cmFjZS1jb3JlLmMgICAgICB8IDc4NyArKysrKysrKysrKysrKysrKysKPiAgZHJpdmVy
cy9od3RyYWNpbmcvcnZ0cmFjZS9ydnRyYWNlLWVuY29kZXIuYyAgIHwgMTMwICsrKwo+ICBkcml2
ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2dHJhY2UtcGVyZi5jICAgICAgfCAzNDUgKysrKysrKysK
PiAgZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFjZS9ydnRyYWNlLXBsYXRmb3JtLmMgIHwgMjA5ICsr
KysrCj4gIGRyaXZlcnMvaHd0cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1yYW1zaW5rLmMgICB8IDMz
OCArKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L3J2dHJhY2UuaCAgICAgICAgICAgICAgICAgICAg
ICAgfCAzNTIgKysrKysrKysKPiAgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvQnVpbGQgICAg
ICAgICAgICAgIHwgICAxICsKPiAgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvYXV4dHJhY2Uu
YyAgICAgICAgIHwgMjE5ICsrKysrCj4gIHRvb2xzL3BlcmYvdXRpbC9CdWlsZCAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMSArCj4gIHRvb2xzL3BlcmYvdXRpbC9hdXh0cmFjZS5jICAgICAg
ICAgICAgICAgICAgICB8ICAgNCArCj4gIHRvb2xzL3BlcmYvdXRpbC9hdXh0cmFjZS5oICAgICAg
ICAgICAgICAgICAgICB8ICAgMSArCj4gIHRvb2xzL3BlcmYvdXRpbC9ydnRyYWNlLWRlY29kZXIu
YyAgICAgICAgICAgICB8ICA5MSArKwo+ICB0b29scy9wZXJmL3V0aWwvcnZ0cmFjZS5oICAgICAg
ICAgICAgICAgICAgICAgfCAgMTkgKwo+ICAyMCBmaWxlcyBjaGFuZ2VkLCAyNjcxIGluc2VydGlv
bnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9yaXNjdix0cmFjZS1jb21wb25lbnQueWFtbAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFjZS9LY29uZmlnCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL01ha2VmaWxlCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2dHJhY2UtY29yZS5jCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2dHJhY2UtZW5jb2Rlci5jCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2dHJhY2UtcGVyZi5j
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2dHJhY2Ut
cGxhdGZvcm0uYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFj
ZS9ydnRyYWNlLXJhbXNpbmsuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9y
dnRyYWNlLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGls
L2F1eHRyYWNlLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvdXRpbC9ydnRyYWNl
LWRlY29kZXIuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi91dGlsL3J2dHJhY2Uu
aAo+Cj4gLS0KPiAyLjQzLjAKPgoKRnJpZW5kbHkgcGluZyA/CgpJZiB0aGlzIHNlcmllcyBsb29r
cyBnb29kIHRvIHlvdSB0aGVuIEkgY2FuIHNlbmQgZmlyc3QgUFIgZm9yIHJ2dHJhY2UgPwoKQmVz
dCBSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
