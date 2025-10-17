Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FDDCCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 11:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VYRlCmBp3uGtumrXoYukYkh7LTs5op/jRPOfcnEFuU=; b=zNjWzbelSAjJTx
	l+4IZoO7Akzo8Swn0YLUqlNlX//E+I4IJ1R98LtM7A0ffRFmu6n+yc5rhXZNDvwqtGztiNmECoxTH
	h7Pbd1sYLHh67xcox4I922cIX8zEH2HwN+jV+2LRrlcg4MT3z5jpkbakylpxRBy3WyTCkbhX6aqd3
	sZ1evQeQAhxyoyf+3i/DPHTwoVAeK4C6bJ5JXtX7652qQf5435hK1Y8GLEDuOyIS4XkdGzIxTCWTD
	3QNIxyQ6VXqhdXzmWCESglWnwV5f9MjvdVyfdCI2IMwnkhGjbqyU3w+Xx/gl1I6QADOVahGoEmYFA
	WTeHgTKZUW6bEjZPtVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9irq-00000007iwD-0eCl;
	Fri, 17 Oct 2025 11:43:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9irn-00000007ivj-0qwN
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 11:43:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7jYbc020618
	for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 11:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4W55KXlYCq2tg9cOzmliCyi3kjaRFsOqXZbQeSMbnIc=; b=QeCGYLQyBHmejqFG
	e4NpYD2eobLd1ZhrG4Ot8rRa0c/T2ie2XjatUQx8ldxRBAmJb9HMEYKeTTdI2nGO
	1iYsMjthNQC9qc6lkVqdzAqCoocd2fulwx2cvf6eGk4G6HtXxylyugAYi1WEUHwd
	zzOiAvm9u4Sx2rNSbXxXGW/qMRQ+Yi+NE9yM8hronTB/7FwmJHlT4w3XrqqqlD4A
	NNPal/EAe7q5QhOQ9qhgbzgAfj7/2Yq1ZBxcTQzYlKCVqH8WThKeiThaG8Tz/To1
	xTRNXSKzYnQr9HMD53kbmHglAW5S/ImUgkjkxppG+asPgnb0ZQRMzOCvmiO7aqhc
	HgEvZg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8tspd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 11:43:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so3131349a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 04:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760701403; x=1761306203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4W55KXlYCq2tg9cOzmliCyi3kjaRFsOqXZbQeSMbnIc=;
        b=inFeXbwovw2pdwW3PGsB2xpHRkxDVZkBh5XLPghEzDjY72J2RG1Hu+HJPJx5cGFa0d
         b3ZrZ39QkxTvsYxrKwVzOm1UN9XtE5U1He+FiEKmHhQhxaD3E1JvR3/nUANr+n4xjaEg
         3P4nlNX46SWvxPMLKdcNI8VQLXkFUkGuW1ZLSgNOQ9+jB/Vhj8eDoO1pDwt7l5gMV1Xp
         3jZzvHNnor/8AfMLqA3fT97rXTRbhidg7LWltqVZ8xVPQe9CpmmNz6t3mjn6RJj+/0N+
         PuIdlkqqEPJQN1rnmLGOhxgbu7wvDKl6MJ9PQgfp55PzsT2B4AQ2vBToWGxc+i3+DgkB
         fHFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsMl9pcMOvLZibcPI8L86S9yWG7JAu8ODQj2wtlyHIRsBaEW40gfcrVlXLjG37CxzD7ZA3KMcli4pveA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIimOxY7x2Aab64k6sq1QT2mg2xBQWBTW3N1d+E+kg4g8t62id
	Vkg1jxyrNUOdLQJa4ffsL/IpirEyHnKpFD8I4YcGGHFjgsZrDCrIF+Hct5XVJE0ytNtEnvADuxf
	i6J3H/14smeBcKKCVEs2bB7gx+9r/7HwVGE428d4Oy2cUS3QjQrrZK3lRlBs0GL8vIN7Vy7c=
X-Gm-Gg: ASbGncvWxbEpHat6ss7RuNKD2GWvgJrosNYetm9cpP3/9q7uE12yW5Aa1dleWlh4E/E
	oHQyRjBzeLzK9i6LJfk2jAvSzxdf0zU2CWg1yoeQYwSaNSkS51SH7vkFEOG2r4XsijyqqJwfi6N
	JloNvc2BTlmFG0rDxU/YHBwqzK9hy83LDBslx0obrgP0pD1kTXXk0tWWot9Dlry1TepwX8aJQ6M
	mIjddazJ9odzCiluDJQjvLskP1ngjJrPsfIjZhcj41HqW75OctET6Y7aubhG4N/G3N76pZozhXw
	+vijh3Ollbkv7FU81bgBtFK5tDUOEOSYhJpU7xRa1Zdb5jMooeXbV3erwUMUSU+H1Yt9sVY1e7e
	I48kw31SQvBHUhBFYLbSK0BigPLS0tg0N
X-Received: by 2002:a17:902:cecb:b0:290:c94b:8381 with SMTP id d9443c01a7336-290c9c89dbbmr43351225ad.7.1760701403166;
        Fri, 17 Oct 2025 04:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHIuWf6nFCUylOReGxBDbEW114FkdHVUYGIcgi5VzOO3e9hKGdXl5u+Ees0bSNS9np3dFSOQ==
X-Received: by 2002:a17:902:cecb:b0:290:c94b:8381 with SMTP id d9443c01a7336-290c9c89dbbmr43350855ad.7.1760701402643;
        Fri, 17 Oct 2025 04:43:22 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aab62bsm61665225ad.78.2025.10.17.04.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:43:22 -0700 (PDT)
Message-ID: <432e4026-208f-459e-82dc-e74ef5da6a87@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 17:13:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
To: Manivannan Sadhasivam <mani@kernel.org>, Ron Economos <re@w6rz.net>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Conor Dooley <conor@kernel.org>,
        bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        regressions@lists.linux.dev
References: <20251013212801.GA865570@bhelgaas>
 <bc7deb1a-5f93-4a36-bd6a-b0600b150d48@oss.qualcomm.com>
 <95a0f2a4-3ddd-4dec-a67e-27f774edb5fd@w6rz.net>
 <759e429c-b160-46ff-923e-000415c749ee@oss.qualcomm.com>
 <b203ba27-7033-41d9-9b43-aa4a7eb75f23@w6rz.net>
 <yxdwo4hppd7c7lrv5pybjtu22aqh3lbk34qxdxmkubgwukvgwq@i4i45fdgm6sw>
 <18ef2c73-fb10-47b3-838f-bc9d3fd2dbc2@w6rz.net>
 <xfpqp3oign7c3336wxo5yexgitxotttrxgkyzbfknjmfk6pmdc@drsk3ardfl5t>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <xfpqp3oign7c3336wxo5yexgitxotttrxgkyzbfknjmfk6pmdc@drsk3ardfl5t>
X-Proofpoint-GUID: 65p6u_INM2HMnotZWohUxl9NJD8tDSen
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f22bdc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HaFmDPmJAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CY4USPus8yibsuyneK0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=nmWuMzfKamIsx3l42hEX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX6VyXenRlo5GO
 h6HfQIVU2BY7xL0i2Cbxnn5ImVGkPWXWkR6SBbR25OstlNC1KgzhUcsgg7sAWRpKd0BLFL5EGe6
 fa8aykhxhVxgwDIrZWBtvMUMcJDwlx4+IlJMBoQSeL+faR2MAmojL3ZupKufgO5vrm9kyfINl9T
 H2P3FuqS0S7/uGIzO2a/pS5KJKiiu9uoBUgU8V5q6Qr0qlqTj7RM2F19BenRX+iWoroply6fO8/
 mSS+S1pZYuUXwlZ9GxGkfzNeZJbevTqZs3Az86m5Vw/sw6h9Qt7Z2Dq7tExJd11EtfZMC84eVWG
 sVTNg747lNu5yFrLIngttM22sF5V+7LSe3LtarJiYZVGMsq11WsLDEO/4omiy/DlWCvNIGtaYYL
 ymRNWfXhvJDDDQIcHT4Ll58HMy+J8g==
X-Proofpoint-ORIG-GUID: 65p6u_INM2HMnotZWohUxl9NJD8tDSen
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_044327_364622_B8A1D146 
X-CRM114-Status: GOOD (  29.15  )
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

CgpPbiAxMC8xNS8yMDI1IDc6MzMgUE0sIE1hbml2YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToKPiBP
biBUdWUsIE9jdCAxNCwgMjAyNSBhdCAwMzo0MTozOVBNIC0wNzAwLCBSb24gRWNvbm9tb3Mgd3Jv
dGU6Cj4+IE9uIDEwLzE0LzI1IDA5OjI1LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4+
PiBPbiBNb24sIE9jdCAxMywgMjAyNSBhdCAxMDo1Mjo0OFBNIC0wNzAwLCBSb24gRWNvbm9tb3Mg
d3JvdGU6Cj4+Pj4gT24gMTAvMTMvMjUgMjI6MzYsIEtyaXNobmEgQ2hhaXRhbnlhIENodW5kcnUg
d3JvdGU6Cj4+Pj4+Cj4+Pj4+IE9uIDEwLzE0LzIwMjUgMTA6NTYgQU0sIFJvbiBFY29ub21vcyB3
cm90ZToKPj4+Pj4+IE9uIDEwLzEzLzI1IDIyOjIwLCBLcmlzaG5hIENoYWl0YW55YSBDaHVuZHJ1
IHdyb3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMTAvMTQvMjAyNSAyOjU4IEFNLCBCam9ybiBIZWxn
YWFzIHdyb3RlOgo+Pj4+Pj4+PiBbK2NjIEZVNzQwIGRyaXZlciBmb2xrcywgQ29ub3IsIHJlZ3Jl
c3Npb25zXQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiBNb24sIE9jdCAxMywgMjAyNSBhdCAxMjoxNDo1
NEFNIC0wNzAwLCBSb24gRWNvbm9tb3Mgd3JvdGU6Cj4+Pj4+Pj4+PiBUaGUgU2lGaXZlIEZVNzQw
IFBDSSBkcml2ZXIgZmFpbHMgb24gdGhlIEhpRml2ZQo+Pj4+Pj4+Pj4gVW5tYXRjaGVkIGJvYXJk
IHdpdGggTGludXgKPj4+Pj4+Pj4+IDYuMTgtcmMxLiBUaGUgZXJyb3IgbWVzc2FnZSBpczoKPj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiBbwqDCoMKgIDMuMTY2NjI0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5w
Y2llOiBob3N0IGJyaWRnZQo+Pj4+Pj4+Pj4gL3NvYy9wY2llQGUwMDAwMDAwMAo+Pj4+Pj4+Pj4g
cmFuZ2VzOgo+Pj4+Pj4+Pj4gW8KgwqDCoCAzLjE2NjcwNl0gZnU3NDAtcGNpZSBlMDAwMDAwMDAu
cGNpZTrCoMKgwqDCoMKgwqAgSU8KPj4+Pj4+Pj4+IDB4MDA2MDA4MDAwMC4uMHgwMDYwMDhmZmZm
IC0+IDB4MDA2MDA4MDAwMAo+Pj4+Pj4+Pj4gW8KgwqDCoCAzLjE2Njc2N10gZnU3NDAtcGNpZSBl
MDAwMDAwMDAucGNpZTrCoMKgwqDCoMKgIE1FTQo+Pj4+Pj4+Pj4gMHgwMDYwMDkwMDAwLi4weDAw
N2ZmZmZmZmYgLT4gMHgwMDYwMDkwMDAwCj4+Pj4+Pj4+PiBbwqDCoMKgIDMuMTY2ODA1XSBmdTc0
MC1wY2llIGUwMDAwMDAwMC5wY2llOsKgwqDCoMKgwqAgTUVNCj4+Pj4+Pj4+PiAweDIwMDAwMDAw
MDAuLjB4M2ZmZmZmZmZmZiAtPiAweDIwMDAwMDAwMDAKPj4+Pj4+Pj4+IFvCoMKgwqAgMy4xNjY5
NTBdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IEVDQU0gYXQgW21lbQo+Pj4+Pj4+Pj4gMHhk
ZjAwMDAwMDAtMHhkZmZmZmZmZmZdIGZvciBbYnVzIDAwLWZmXQo+Pj4+Pj4+Pj4gW8KgwqDCoCAz
LjU3OTUwMF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogTm8gaUFUVSByZWdpb25zIGZvdW5k
Cj4+Pj4+Pj4+PiBbwqDCoMKgIDMuNTc5NTUyXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBG
YWlsZWQgdG8KPj4+Pj4+Pj4+IGNvbmZpZ3VyZSBpQVRVIGluIEVDQU0KPj4+Pj4+Pj4+IG1vZGUK
Pj4+Pj4+Pj4+IFvCoMKgwqAgMy41Nzk2NTVdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IHBy
b2JlIHdpdGgKPj4+Pj4+Pj4+IGRyaXZlciBmdTc0MC1wY2llCj4+Pj4+Pj4+PiBmYWlsZWQgd2l0
aCBlcnJvciAtMjIKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBUaGUgbm9ybWFsIG1lc3NhZ2UgKG9uIExp
bnV4IDYuMTcuMikgaXM6Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gW8KgwqDCoCAzLjM4MTQ4N10gZnU3
NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogaG9zdCBicmlkZ2UKPj4+Pj4+Pj4+IC9zb2MvcGNpZUBl
MDAwMDAwMDAKPj4+Pj4+Pj4+IHJhbmdlczoKPj4+Pj4+Pj4+IFvCoMKgwqAgMy4zODE1ODRdIGZ1
NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoMKgIElPCj4+Pj4+Pj4+PiAweDAwNjAw
ODAwMDAuLjB4MDA2MDA4ZmZmZiAtPiAweDAwNjAwODAwMDAKPj4+Pj4+Pj4+IFvCoMKgwqAgMy4z
ODE2ODJdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoCBNRU0KPj4+Pj4+Pj4+
IDB4MDA2MDA5MDAwMC4uMHgwMDdmZmZmZmZmIC0+IDB4MDA2MDA5MDAwMAo+Pj4+Pj4+Pj4gW8Kg
wqDCoCAzLjM4MTcyNF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKgIE1FTQo+
Pj4+Pj4+Pj4gMHgyMDAwMDAwMDAwLi4weDNmZmZmZmZmZmYgLT4gMHgyMDAwMDAwMDAwCj4+Pj4+
Pj4+PiBbwqDCoMKgIDMuNDg0ODA5XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBpQVRVOiB1
bnJvbGwKPj4+Pj4+Pj4+IFQsIDggb2IsIDggaWIsIGFsaWduCj4+Pj4+Pj4+PiA0SywgbGltaXQg
NDA5NkcKPj4+Pj4+Pj4+IFvCoMKgwqAgMy42ODM2NzhdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBj
aWU6IFBDSWUgR2VuLjEgeDggbGluayB1cAo+Pj4+Pj4+Pj4gW8KgwqDCoCAzLjg4MzY3NF0gZnU3
NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogUENJZSBHZW4uMyB4OCBsaW5rIHVwCj4+Pj4+Pj4+PiBb
wqDCoMKgIDMuOTg3Njc4XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBQQ0llIEdlbi4zIHg4
IGxpbmsgdXAKPj4+Pj4+Pj4+IFvCoMKgwqAgMy45ODgxNjRdIGZ1NzQwLXBjaWUgZTAwMDAwMDAw
LnBjaWU6IFBDSSBob3N0Cj4+Pj4+Pj4+PiBicmlkZ2UgdG8gYnVzIDAwMDA6MDAKPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+PiBSZXZlcnRpbmcgdGhlIGZvbGxvd2luZyBjb21taXRzIHNvbHZlcyB0aGUgaXNz
dWUuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gMGRhNDhjNWIyZmE3MzFiMjFiYzUyM2M4MmQ5MjczOTlh
MWU1MDhiMCBQQ0k6IGR3YzoKPj4+Pj4+Pj4+IFN1cHBvcnQgRUNBTSBtZWNoYW5pc20gYnkKPj4+
Pj4+Pj4+IGVuYWJsaW5nIGlBVFUgJ0NGRyBTaGlmdCBGZWF0dXJlJwo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+IDQ2NjBlNTBjZjgxODAwZjgyZWVlY2Y3NDNhZDFlM2U5N2FiNzIxOTAgUENJOiBxY29tOgo+
Pj4+Pj4+Pj4gUHJlcGFyZSBmb3IgdGhlIERXQyBFQ0FNCj4+Pj4+Pj4+PiBlbmFibGVtZW50Cj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gZjZmZDM1N2Y3YWZiZWIzNGE2MzNlNTY4OGEyM2I5ZDdlYjQ5ZDU1
OCBQQ0k6IGR3YzoKPj4+Pj4+Pj4+IFByZXBhcmUgdGhlIGRyaXZlciBmb3IKPj4+Pj4+Pj4+IGVu
YWJsaW5nIEVDQU0gbWVjaGFuaXNtIHVzaW5nIGlBVFUgJ0NGRyBTaGlmdCBGZWF0dXJlJwo+Pj4+
Pj4+PiBBcyBDb25vciBwb2ludGVkIG91dCwgd2UgY2FuJ3QgZml4IGEgY29kZSByZWdyZXNzaW9u
IHdpdGggYSBEVCBjaGFuZ2UuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICNyZWd6Ym90IGludHJvZHVjZWQ6
IGY2ZmQzNTdmN2FmYiAoIlBDSTogZHdjOiBQcmVwYXJlIHRoZQo+Pj4+Pj4+PiBkcml2ZXIgZm9y
IGVuYWJsaW5nIEVDQU0gbWVjaGFuaXNtIHVzaW5nIGlBVFUgJ0NGRyBTaGlmdAo+Pj4+Pj4+PiBG
ZWF0dXJlJyIpCj4+Pj4+Pj4gSGkgQ29ub3IsCj4+Pj4+Pj4KPj4+Pj4+PiBDYW4geW91IHRyeSB3
aXRoIHRoaXMgcGF0Y2ggYW5kIHNlZSBpZiBpdCBpcyBmaXhpbmcgdGhlIGlzc3VlLgo+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMKPj4+
Pj4+PiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYwo+Pj4+Pj4+IGlu
ZGV4IDY2MzY3MjUyMDMyYi4uYjVlMGYwMTZhNTgwIDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYwo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYwo+Pj4+Pj4+IEBAIC0zMjgsNiArMzI4LDgg
QEAgc3RhdGljIGludCBmdTc0MF9wY2llX3Byb2JlKHN0cnVjdAo+Pj4+Pj4+IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPj4+Pj4+Pgo+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqAgcGxhdGZvcm1fc2V0
X2RydmRhdGEocGRldiwgYWZwKTsKPj4+Pj4+Pgo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqAgcGNpLT5w
cC5uYXRpdmVfZWNhbSA9IHRydWU7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIGR3X3BjaWVfaG9zdF9pbml0KCZwY2ktPnBwKTsKPj4+Pj4+PiAgIMKgfQo+Pj4+Pj4+
Cj4+Pj4+Pj4gLSBLcmlzaG5hIENoYWl0YW55YS4KPj4+Pj4+Pgo+Pj4+Pj4gSSd2ZSBhbHJlYWR5
IHRyaWVkIGl0LiBJdCBkb2Vzbid0IHdvcmsuIFNhbWUgZXJyb3IgbWVzc2FnZSBhcyBiZWZvcmUu
Cj4+Pj4+IENhbiB5b3Ugc2hhcmUgdXMgZG1lc2cgbG9ncyBmb3IgdGhpcyBjaGFuZ2UuCj4+Pj4+
Cj4+Pj4+IC0gS3Jpc2huYSBDaGFpdGFueWEuCj4+Pj4gW8KgwqDCoCAzLjE1OTc2M10gZnU3NDAt
cGNpZSBlMDAwMDAwMDAucGNpZTogaG9zdCBicmlkZ2UgL3NvYy9wY2llQGUwMDAwMDAwMAo+Pj4+
IHJhbmdlczoKPj4+PiBbwqDCoMKgIDMuMTU5ODUzXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2ll
OsKgwqDCoMKgwqDCoCBJTwo+Pj4+IDB4MDA2MDA4MDAwMC4uMHgwMDYwMDhmZmZmIC0+IDB4MDA2
MDA4MDAwMAo+Pj4+IFvCoMKgwqAgMy4xNTk5MTZdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6
wqDCoMKgwqDCoCBNRU0KPj4+PiAweDAwNjAwOTAwMDAuLjB4MDA3ZmZmZmZmZiAtPiAweDAwNjAw
OTAwMDAKPj4+PiBbwqDCoMKgIDMuMTU5OTUzXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOsKg
wqDCoMKgwqAgTUVNCj4+Pj4gMHgyMDAwMDAwMDAwLi4weDNmZmZmZmZmZmYgLT4gMHgyMDAwMDAw
MDAwCj4+Pj4gW8KgwqDCoCAzLjE2MDAzOV0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogRUNB
TSBhdCBbbWVtCj4+Pj4gMHhkZjAwMDAwMDAtMHhkZmZmZmZmZmZdIGZvciBbYnVzIDAwLWZmXQo+
Pj4+IFvCoMKgwqAgMy41NzE0MjFdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IE5vIGlBVFUg
cmVnaW9ucyBmb3VuZAo+Pj4+IFvCoMKgwqAgMy41NzE0NzJdIGZ1NzQwLXBjaWUgZTAwMDAwMDAw
LnBjaWU6IEZhaWxlZCB0byBjb25maWd1cmUgaUFUVSBpbiBFQ0FNCj4+Pj4gbW9kZQo+Pj4+IFvC
oMKgwqAgMy41NzE1MjldIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IHByb2JlIHdpdGggZHJp
dmVyIGZ1NzQwLXBjaWUKPj4+PiBmYWlsZWQgd2l0aCBlcnJvciAtMjIKPj4+Pgo+Pj4+IFNhbWUg
YXMgYmVmb3JlIHRoZSBjaGFuZ2UuIFRoZSBlbnRpcmUgbG9nIGlzIGhlcmU6Cj4+Pj4KPj4+PiBo
dHRwczovL3d3dy53NnJ6Lm5ldC9kbWVzZy50eHQKPj4+Pgo+Pj4gV2VpcmQgdGhhdCB0aGUgZHJp
dmVyIHN0aWxsIGNyZWF0ZXMgRUNBTSBldmVuIGFmdGVyIHNraXBwaW5nIGl0IHVzaW5nIHRoZSBm
bGFnLgo+Pj4gVGhlIGZsYWcgaXMgbm90IG1lYW50IGZvciB0aGF0IHB1cnBvc2UsIGJ1dCBpdCBz
aG91bGQndmUgd29ya2VkIGFueXdheS4KPj4+Cj4+PiBDYW4geW91IHRyeSB0aGlzIGRpZmYgYW5k
IHNoYXJlIHRoZSBkbWVzZyBsb2c/Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1ob3N0LmMgYi9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtaG9zdC5jCj4+PiBpbmRleCAyMGM5MzMzYmNiMWMuLjU4
MDgwOTI4ZGY5ZiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtZGVzaWdud2FyZS1ob3N0LmMKPj4+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtZGVzaWdud2FyZS1ob3N0LmMKPj4+IEBAIC01MjMsOCArNTIzLDEyIEBAIHN0YXRpYyBp
bnQgZHdfcGNpZV9ob3N0X2dldF9yZXNvdXJjZXMoc3RydWN0IGR3X3BjaWVfcnAgKnBwKQo+Pj4g
ICAgICAgICAgIHBwLT5jZmcwX3NpemUgPSByZXNvdXJjZV9zaXplKHJlcyk7Cj4+PiAgICAgICAg
ICAgcHAtPmNmZzBfYmFzZSA9IHJlcy0+c3RhcnQ7Cj4+Pgo+Pj4gKyAgICAgICBkZXZfaW5mbyhk
ZXYsICIlczogJWQgbmF0aXZlX2VjYW06ICVkIiwgX19mdW5jX18sIF9fTElORV9fLAo+Pj4gK3Bw
LT5uYXRpdmVfZWNhbSk7Cj4+PiArCj4+PiAgICAgICAgICAgcHAtPmVjYW1fZW5hYmxlZCA9IGR3
X3BjaWVfZWNhbV9lbmFibGVkKHBwLCByZXMpOwo+Pj4gICAgICAgICAgIGlmIChwcC0+ZWNhbV9l
bmFibGVkKSB7Cj4+PiArICAgICAgICAgICAgICAgZGV2X2luZm8oZGV2LCAiJXM6ICVkIEVDQU0g
RU5BQkxFRCIsIF9fZnVuY19fLCBfX0xJTkVfXyk7Cj4+PiAgICAgICAgICAgICAgICAgICByZXQg
PSBkd19wY2llX2NyZWF0ZV9lY2FtX3dpbmRvdyhwcCwgcmVzKTsKPj4+ICAgICAgICAgICAgICAg
ICAgIGlmIChyZXQpCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+
PiBAQCAtNTMzLDYgKzUzNyw3IEBAIHN0YXRpYyBpbnQgZHdfcGNpZV9ob3N0X2dldF9yZXNvdXJj
ZXMoc3RydWN0IGR3X3BjaWVfcnAgKnBwKQo+Pj4gICAgICAgICAgICAgICAgICAgcHAtPmJyaWRn
ZS0+c3lzZGF0YSA9IHBwLT5jZmc7Cj4+PiAgICAgICAgICAgICAgICAgICBwcC0+Y2ZnLT5wcml2
ID0gcHA7Cj4+PiAgICAgICAgICAgfSBlbHNlIHsKPj4+ICsgICAgICAgICAgICAgICBkZXZfaW5m
byhkZXYsICIlczogJWQgRUNBTSBESVNBQkxFRCIsIF9fZnVuY19fLCBfX0xJTkVfXyk7Cj4+PiAg
ICAgICAgICAgICAgICAgICBwcC0+dmFfY2ZnMF9iYXNlID0gZGV2bV9wY2lfcmVtYXBfY2ZnX3Jl
c291cmNlKGRldiwgcmVzKTsKPj4+ICAgICAgICAgICAgICAgICAgIGlmIChJU19FUlIocHAtPnZh
X2NmZzBfYmFzZSkpCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJS
KHBwLT52YV9jZmcwX2Jhc2UpOwo+Pj4KPj4+IC0gTWFuaQo+Pj4KPj4gQWZ0ZXIgdGVzdGluZyB3
aXRoIHRoaXMgcGF0Y2gsIEkgbXVzdCBoYXZlIHRyYW5zZmVycmVkIHRoZSB3cm9uZyBpbWFnZSB0
bwo+PiB0aGUgdGFyZ2V0IHdoZW4gdGVzdGluZyBiZWZvcmUuIFRoZSAicGNpLT5wcC5uYXRpdmVf
ZWNhbSA9IHRydWU7IiBwYXRjaCB0bwo+PiBwY2llLWZ1NzQwLmMgZG9lcyB3b3JrLgo+IAo+IFRo
YW5rcyEgSG93ZXZlciwgaXQgd2FzIG5vdCBhIHByb3BlciBmaXguIFRoZSBpc3N1ZSBzZWVtcyB0
byBiZSBkdWUgdGhlCj4gYXNzdW1wdGlvbiB0aGF0IHRoZSB3aG9sZSBEQkkgc3BhY2UgKFJvb3Qg
UG9ydCArIG1pc2MgcmVnaXN0ZXJzKSBsaWVzIGF0IHRoZQo+IHN0YXJ0IG9mIHRoZSBFQ0FNIHJl
Z2lvbi4gVGhpcyBpcyB0cnVlIGZvciBRY29tLCBidXQgbm90IGZvciBhbGwgRFdDIGdsdWUKPiBw
bGF0Zm9ybXMuCj4gCj4gS3Jpc2huYSBpcyB3b3JraW5nIG9uIGEgcGF0Y2ggdGhhdCBkZWNvdXBs
ZXMgdGhlIERCSSByZWdpb24gZnJvbSBFQ0FNIHNvIHRoYXQKPiB0aGUgZHJpdmVyIHdpbGwgY29u
dGludWUgdXNpbmcgREJJIGZvciBhY2Nlc3NpbmcgUm9vdCBQb3J0IGNvbmZpZyBzcGFjZSBhbmQg
RUNBTQo+IGZvciBidXMgPiAwLgo+IAo+IFRoaXMgaXMgb25lIHN0ZXAgYmFja3dhcmRzIGZvciBF
Q0FNIHNpbmNlIHRoZSBkcml2ZXIgaXMgc3VwcG9zZWQgdG8gdXNlIEVDQU0gZm9yCj4gYWNjZXNz
aW5nIGFsbCBkZXZpY2VzIHN0YXJ0aW5nIGZyb20gdGhlIFJvb3QgUG9ydC4gQnV0IHNpbmNlIERX
QyBoYXMgY2x1YmJlZAo+IG5vbi1Sb290IFBvcnQgc3BlY2lmaWMgcmVnaXN0ZXJzIGluIHRoZSBE
Qkkgc3BhY2UsIHdlIGhhdmUgdG8gbGl2ZSB3aXRoIHRoaXMKPiBsaW1pdGF0aW9uIGFzIEVDQU0g
aXMgc3VwcG9zZWQgdG8gYWNjZXNzIG9ubHkgUm9vdCBQb3J0IHNwZWNpZmljIHJlZ2lzdGVycy4K
PiAKPiBUaGUgcGF0Y2ggd2lsbCBiZSBwb3N0ZWQgYWZ0ZXIgaW50ZXJuYWwgdmFsaWRhdGlvbiBh
c2FwLgo+IApIaSBSb24sCgpDYW4geW91IHRyeSB3aXRoIHRoaXMgc2VyaWVzIGFuZCBsZXQgdXMg
a25vdyBpZiBpdCBpcyBoZWxwaW5nIHlvdSBvcgpub3QuCgpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNTEwMTctZWNhbV9maXgtdjEtMC1mNmZhYTNkMGVkZjNAb3NzLnF1YWxjb21tLmNv
bS8KCi0gS3Jpc2huYSBDaGFpdGFueWEuCgo+IC0gTWFuaQo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
